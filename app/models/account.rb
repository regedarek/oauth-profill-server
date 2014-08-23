module OauthProfillServer
  module Models
    class Account < ActiveRecord::Base

      def as_json(options={})
        super({except: [:password, :created_at]}.merge(options))
      end
    end
  end
end
