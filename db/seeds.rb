account = OauthProfillServer::Models::Account.new
account.username = 'Bartek'
account.save

application = OauthProfillServer::Models::Application.new
application.identifier    = 'angurailsspike'
application.account_id    = account.id
application.secret        = 'application_secret'
application.name          = 'AnguRailsSpike'
application.website       = 'http://192.168.0.100:9000'
application.redirect_uri  = 'http://192.168.0.100:9000/oauth/authorize/callback'
application.save
