require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

require 'dotenv'
Dotenv.load

require 'sinatra/base'
require 'sinatra/activerecord'
require 'pry-byebug'

require 'app/models'
require 'app/routes'

module OauthProfillServer
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    configure do
      set :database, {
        adapter: "sqlite3",
        database: "db/oauthdb.sqlite3"
      }

      set :sessions,
          :httponly     => true,
          :secure       => false,
          :expire_after => 5.years,
          :secret       => ENV['SESSION_SECRET']
    end

    use OauthProfillServer::Routes::Accounts
    use OauthProfillServer::Routes::Clients
    use OauthProfillServer::Routes::V1::Authorizations
    use OauthProfillServer::Routes::V1::Sessions
  end
end

include OauthProfillServer::Models
