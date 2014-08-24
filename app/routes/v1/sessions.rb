module Oauth2Provider
  module Routes
    module V1
      class Sessions < Base
        post '/v1/sign_in' do
          @account = ::Account.find_by(username: params[:username])
          @oauth2 = Songkick::OAuth2::Provider.parse(@account, env)

          puts "Params: #{params.inspect}"
          puts "Account: #{@account.inspect}"

          session[:account_id] = @account.id

          erb(@account ? :authorize : :sign_in)
        end
      end
    end
  end
end
