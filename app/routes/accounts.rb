module OauthProfillServer
  module Routes
    class Accounts < Base
      get '/accounts' do
        content_type :json
        OauthProfillServer::Models::Account.all.to_json
      end
    end
  end
end
