class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = '無効なメールアドレス、もしくは無効なパスワード、もしくはその両方です'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
