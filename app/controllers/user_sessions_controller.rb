class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Login successful.'
      redirect_back_or_default root_path
    else
      flash[:error] = 'Incorrect login or password.'
      redirect_to login_path
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Logout successful.'
    redirect_back_or_default root_path
  end

end
