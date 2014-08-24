require 'dotenv/tasks'
require 'oauth2'
require 'pry-byebug'

namespace :oauth do
  task :test => :dotenv do
    client_id = 'm09wkkvpcnbbjtsej0q46ooqsm7yse3'
    secret    = 'application_secret'
    options   = {
      site: 'http://0.0.0.0:9292',
      authorize_url: 'http://0.0.0.0:9292/v1/oauth/authorize',
      redirect_uri: 'http://0.0.0.0:9293/oauth/authorize/callback'
    }
    client = OAuth2::Client.new(client_id, secret, options)
    url = client.auth_code.authorize_url(options[:redirect_uri])
    puts url
    # token = client.auth_code.get_token('authorization_code_value', :redirect_uri => 'http://localhost:8080/oauth2/callback', :headers => {'Authorization' => 'Basic some_password'})
    # response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
  end
end
