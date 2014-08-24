require './app'

run Oauth2Provider::App

map "/accounts" do
  use RackApiVersioning::Middleware
  run Oauth2Provider::Routes::V1::Accounts
end
