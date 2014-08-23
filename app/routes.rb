module OauthProfillServer
  module Routes
    autoload :Base, 'app/routes/base'
    autoload :Accounts, 'app/routes/accounts'
    autoload :Applications, 'app/routes/applications'
    autoload :Authorizations, 'app/routes/authorizations'

    # Example route loading:
    # autoload :Posts, 'app/routes/posts'
  end
end
