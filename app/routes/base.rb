module OauthProfillServer
  module Routes
    class Base < Sinatra::Application
      configure do
        set :root, App.root
      end
    end
  end
end
