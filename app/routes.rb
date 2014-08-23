module OauthProfillServer
  module Routes
    autoload :Base, 'app/routes/base'
    autoload :Accounts, 'app/routes/accounts'
    autoload :Clients, 'app/routes/clients'
    autoload :Authorizations, 'app/routes/authorizations'

    # Example route loading:
    # autoload :Posts, 'app/routes/posts'
  end
end
