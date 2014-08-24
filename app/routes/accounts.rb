module Oauth2Provider
  module Routes
    class Accounts < Base
      get '/accounts' do
        content_type :json
        Oauth2Provider::Models::Account.all.to_json
      end
    end
  end
end
