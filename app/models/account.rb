module OauthProfillServer
  module Models
    class Account < ActiveRecord::Base
      has_many :clients

      def as_json(options={})
        super({except: [:password, :created_at]}.merge(options))
      end
    end
  end
end
