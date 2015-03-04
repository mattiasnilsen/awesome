class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
  	@user = User.new
  end

  def create
  	if @user = login(params[:email], params[:password])
  		redirect_back_or_to(:songs, notice: 'Login successful')
  	else
  		flash.now[:alert] = 'Login out'
      redirect_to(:login)
  	end
  end

  def destroy
  	logout
  	redirect_to(:songs)
  end
end
