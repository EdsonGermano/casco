require "rubygems"
require "bundler/setup"
require "sinatra"
require 'platform-api'

class Casco < Sinatra::Base
  post '/restart' do
    if params["key"] == ENV['RESTART_WEBHOOK_KEY'] && ENV['RESTART_API_KEY']
      @@connection ||= PlatformAPI.connect_oauth(ENV['RESTART_API_KEY'])

      # Fetch our dyno info
      restarted = 0
      @@connection.dyno.list(ENV['VICTIM_APP_NAME']).select { |dyno|
        dyno['type'] == 'web'
      }.each { |dyno|
        puts "Restarting #{ENV['VICTIM_APP_NAME']} dyno #{dyno['name']}"
        @@connection.dyno.restart(ENV['VICTIM_APP_NAME'], dyno['name'])
        restarted += 1
      }
      
      return [200, "As you wish! Restarted #{restarted} dynos."]
    else
      return [403, "You didn't say the magic word!"]
    end
  end
end

run Casco
