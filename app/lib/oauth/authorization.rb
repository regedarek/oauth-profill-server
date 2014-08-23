module Oauth
  class Authorization
    include ActiveModel::Validations

    RESPONSE_TYPE       = 'response_type'
    CLIENT_ID           = 'client_id'
    REDIRECT_URI        = 'redirect_uri'
    AUTHORIZATION_TOKEN = 'authorization_token'
    SCOPE               = 'scope'
    STATE               = 'state'
    REQUIRED_PARAMS     = [RESPONSE_TYPE, CLIENT_ID, REDIRECT_URI]
    VALID_PARAMS        = REQUIRED_PARAMS + [SCOPE, STATE]

    attr_reader :errors

    def initialize(account_id, params)
      @params   = params
      @errors   = ActiveModel::Errors.new(self)
      @account  = ::Account.find(account_id)
      @client   = ::Client.find(params['client_id'])
      validate!
    end

    def valid?
      validate!
      errors.empty?
    end

    def validate!
      REQUIRED_PARAMS.each do |param|
        unless valid_params.has_key?(param)
          errors.add(:params, "#{param} cannot be nil")
        end
      end
    end

    private

    def valid_params
      @params.slice(*VALID_PARAMS)
    end
  end
end
