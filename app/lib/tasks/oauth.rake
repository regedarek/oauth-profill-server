require 'dotenv/tasks'
require 'oauth2'
require 'pry-byebug'

namespace :oauth do
  task :test => :dotenv do
    client = OAuth2::Client.new("m09wkkvpcnbbjtsej0q46ooqsm7yse3", 'application_secret', site: 'http://0.0.0.0:9292')
    url = client.auth_code.authorize_url(redirect_uri: "http://0.0.0.0:9293/oauth/authorize/callback")
    puts url

    # token = client.auth_code.get_token('authorization_code_value', :redirect_uri => 'http://localhost:8080/oauth2/callback', :headers => {'Authorization' => 'Basic some_password'})
    # response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
    # response.class.name
  end
end
