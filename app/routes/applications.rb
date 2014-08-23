module OauthProfillServer
  module Routes
    class Applications < Base
      get '/v1/applications' do
        content_type :json
        OauthProfillServer::Models::Application.all.to_json
      end
    end
  end
end
