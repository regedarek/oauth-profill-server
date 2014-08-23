module OauthProfillServer
  module Routes
    class Clients < Base
      get '/v1/clients' do
        content_type :json
        OauthProfillServer::Models::Client.all.to_json
      end
    end
  end
end
