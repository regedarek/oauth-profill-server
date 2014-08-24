module Oauth2Provider
  module Routes
    autoload :Base,     'app/routes/base'
    # autoload :Accounts, 'app/routes/v2/accounts'
    autoload :Clients,  'app/routes/clients'
    module V1
      autoload :Accounts, 'app/routes/v1/accounts'
      autoload :Authorizations, 'app/routes/v1/authorizations'
      autoload :Sessions,       'app/routes/v1/sessions'
    end
    module V2
      autoload :Accounts, 'app/routes/v2/accounts'
    end
  end
end
