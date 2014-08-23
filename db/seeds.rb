account = OauthProfillServer::Models::Account.new
account.username = 'Bartek'
account.save

client = OauthProfillServer::Models::Client.new
client.identifier    = 'angurailsspike'
client.account_id    = account.id
client.secret        = 'application_secret'
client.name          = 'AnguRailsSpike'
client.website       = 'http://192.168.0.100:9000'
client.redirect_uri  = 'http://192.168.0.100:9000/oauth/authorize/callback'
client.save
