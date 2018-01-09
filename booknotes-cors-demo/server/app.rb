require 'bundler'
Bundler.require

require 'sinatra/reloader' if development?

use Rack::Cors do
  allow do
    origins '*'
    resource '*',
      methods: [:get, :post, :options],
      headers: :any,
      expose: ['HTTP_AUTHORIZATION']
  end
end

token = 'cde'

before do
  pass if request.path == '/sign_in'
  halt 401 unless request.env['HTTP_AUTHORIZATION'] == token
end

get '/sign_in' do
  headers 'HTTP_AUTHORIZATION' => token
  status 200
end

get '/protected' do
  status 200
end
