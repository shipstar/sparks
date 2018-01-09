require 'sinatra'
require 'sinatra/json'
require 'jwt'

set :port, 9001

USERS = [
  {
    id: 1,
    email: 'kyleashipley@gmail.com',
    password: 'abab'
  }
]

SECRET = 'secret'

def authenticate(email, password)
  USERS.find { |u| u[:email] == email && u[:password] == password }
end

get '/' do
  json message: "Hello world!"
end

post '/login' do
  if user = authenticate(params[:email], params[:password])
    headers['token'] = JWT.encode({
      id: user[:id],
      exp: (Time.now + 30).to_i # 30 seconds
    }, SECRET)
    json message: 'success'
  else
    status 401
    json message: 'failure'
  end
end

before '/secure/*' do
  begin
    JWT.decode(request.env['HTTP_AUTHORIZATION'], SECRET)
  rescue JWT::ExpiredSignature
    halt 401
  end
end

post '/secure/data' do
  json message: 'secure data'
end
