module Oauth2Provider
  module Routes
    module V3
      class Accounts < Base
        get '/accounts' do
          content_type :json
          'version 3'
        end
      end
    end
  end
end
