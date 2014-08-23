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

libraries = Dir[File.expand_path('../lib/**/*.rb', __FILE__)]
libraries.each do |path_name|
  require path_name
end

require 'app/models'
require 'app/routes'

module OauthProfillServer
  class App < Sinatra::Application
    register Sinatra::ActiveRecordExtension

    configure do
      set :database, {adapter: "sqlite3", database: "oauthdb.sqlite3"}
    end

    use OauthProfillServer::Routes::Applications
  end
end

include OauthProfillServer::Models
