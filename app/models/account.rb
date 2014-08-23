module OauthProfillServer
  module Models
    class Account < ActiveRecord::Base
      include Songkick::OAuth2::Model::ResourceOwner
      include Songkick::OAuth2::Model::ClientOwner

      def as_json(options={})
        super({except: [:password, :created_at]}.merge(options))
      end
    end
  end
end
