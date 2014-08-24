module Oauth2Provider
  module Routes
    autoload :Base,     'app/routes/base'
    autoload :Accounts, 'app/routes/accounts'
    autoload :Clients,  'app/routes/clients'
    module V1
      autoload :Authorizations, 'app/routes/v1/authorizations'
      autoload :Sessions,       'app/routes/v1/sessions'
    end
  end
end
