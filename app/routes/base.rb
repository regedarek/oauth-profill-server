module Oauth2Provider
  module Routes
    class Base < Sinatra::Base
      configure do
        set :root, App.root
        set :views, 'app/views'
        set :erb, escape_html: true
      end
    end
  end
end
