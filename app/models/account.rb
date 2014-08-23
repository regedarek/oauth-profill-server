module OauthProfillServer
  module Models
    class Account < ActiveRecord::Base
      def updated_at
        super.strftime("%m/%d/%Y at %I:%M%p")
      end

      def as_json(options={})
        super({except: [:password, :created_at], methods: :updated_at}.merge(options))
      end
    end
  end
end
