module OauthProfillServer
  module Models
    class Application < ActiveRecord::Base
      def as_json(options={})
        super({except: [:created_at, :updated_at]}.merge(options))
      end
    end
  end
end
