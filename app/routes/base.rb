module OauthProfillServer
  module Routes
    class Base < Sinatra::Application
      configure do
        set :root, App.root
        set :views, 'app/views'
        set :erb, escape_html: true
      end
    end
  end
end
