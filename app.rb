require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)

require 'dotenv'
Dotenv.load

require 'sinatra/base'
require "sinatra/activerecord"

require 'app/models'
require 'app/routes'
require 'app/lib/oauth'

module OauthProfillServer
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    configure do
      set :database, {adapter: "sqlite3", database: "oauthdb.sqlite3"}

      set :sessions,
          :httponly     => true,
          :secure       => false,
          :expire_after => 5.years,
          :secret       => ENV['SESSION_SECRET']
    end

    use Oauth
    use OauthProfillServer::Routes::Applications
  end
end

include OauthProfillServer::Models
