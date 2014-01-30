class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
end
