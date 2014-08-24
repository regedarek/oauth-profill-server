module OauthProfillServer
  module Routes
    class Clients < Base
      get '/clients' do
        content_type :json
        Songkick::OAuth2::Model::Client.all.to_json
      end
    end
  end
end
