require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'
require 'pry'
require 'pry-nav'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "dev.db"
)

class Metric < ActiveRecord::Base
  def host
    URI.parse(referrer).host
  end
end

# unless Metric.table_exists?
#   class CreateMetrics < ActiveRecord::Migration
#     def change
#       create_table :metrics do |t|
#         t.string :event
#         t.string :ip_address
#         t.string :referrer
#         t.timestamps
#       end
#     end
#   end

#   CreateMetrics.new.change
# end

module Metrics
  def external?
    URI.parse(request.base_url).host != URI.parse(request.referrer).host
  end

  %w(acquire activate freemium_retain revenue premium_retain referral).each do |event|
    define_method event do |pattern|
      before pattern do
        mark event
      end
    end
  end

  def mark(event)
    params = {
      event: event,
      ip_address: request.ip
    }
    params.merge!(referrer: request.referrer) if external?
    Metric.create!(params) unless Metric.where(params.slice(:event, :ip_address)).exists?
  end
end

include Metrics

acquire '/'
activate '/sign_up'

get '/' do
  <<-EOHTML
    <h1>Hello World!</h1>
    <form action="/sign_up" method="POST">
      <input type="submit" value="Submit!">
    </form>
  EOHTML
end

post '/sign_up' do
  "<h1>I signed up!</h1>"
end

# Events
# acquire :index (with referrer), or visit '/home', etc.
# activate :create
# freemium_retain :create
# revenue :create
# premium_retain :create
# referral :create