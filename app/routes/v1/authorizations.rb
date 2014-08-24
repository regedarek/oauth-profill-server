module OauthProfillServer
  module Routes
    module V1
      class Authorizations < Base
        get '/v1/oauth/authorize' do
          @account = ::Account.find(session[:account_id])
          @oauth2 = Songkick::OAuth2::Provider.parse(@account, env)

          puts "Account: #{@account.inspect}"
          puts "Session: #{session.inspect}"
          puts "Env: #{env.inspect}"
          puts "Oauth2: #{@oauth2.inspect}"

          if @account
            if @oauth2.valid?
              erb :authorize
            end
          else
            erb :sign_in
          end
        end

        post '/v1/oauth/allow' do
          @account = Account.find(session[:account_id])
          @auth = Songkick::OAuth2::Provider::Authorization.new(@account, params)
          if params['allow'] == '1'
            @auth.grant_access!
          else
            @auth.deny_access!
          end
          redirect @auth.redirect_uri, @auth.response_status
        end

        post '/v1/oauth/authorize' do
          @account = ::Account.find(session[:account_id])
          @oauth2 = Songkick::OAuth2::Provider.parse(@account, env)

          if @oauth2.redirect?
            redirect @oauth2.redirect_uri, @oauth2.response_status
          end

          headers @oauth2.response_headers
          status  @oauth2.response_status

          if body = @oauth2.response_body
            body
          elsif @oauth2.valid?
            erb :sign_in
          else
            erb :error
          end
        end

        get '/v1/oauth/me' do
          authorization = Songkick::OAuth2::Provider.access_token(:implicit, [], env)
          headers authorization.response_headers
          status  authorization.response_status

          if authorization.valid?
            account = authorization.owner
            JSON.unparse('username' => account.username)
          else
            ERROR_RESPONSE
          end
        end
      end
    end
  end
end
