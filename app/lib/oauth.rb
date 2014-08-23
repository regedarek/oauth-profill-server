module Oauth
  ROOT = File.expand_path(File.dirname(__FILE__) + '/..')
  autoload :Authorization, ROOT + '/lib/oauth/authorization'
end
