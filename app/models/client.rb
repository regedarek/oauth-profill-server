module OauthProfillServer
  module Models
    class Client < ActiveRecord::Base
      belongs_to :account

      def as_json(options={})
        super({except: [:created_at, :updated_at]}.merge(options))
      end
    end
  end
end
