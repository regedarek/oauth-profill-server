module OauthProfillServer
  module Routes
    class Authorizations < Base
      get '/v1/authorize' do
        @oauth = ::Oauth.new(params)
        @account = ::Account.find(session[:account_id])

        puts "Account: #{@account.inspect}"
        puts "Session: #{session.inspect}"

        if @account
          if @oauth.valid?
            erb :authorize
          end
        else
          erb :sign_in
        end
      end

      post '/v1/sign_in' do
        @account = ::Account.find_by(username: params[:username])
        @oauth = ::Oauth.new(params)

        puts "Params: #{params.inspect}"
        puts "Account: #{@account.inspect}"

        session[:account_id] = @account.id

        redirect '/v1/authorize'
      end

      post '/v1/allow' do
        @account = ::Account.find(session[:account_id])
        redirect 'http://wp.pl'
      end
    end
  end
end
