class UsersController < ApplicationController
  before_filter :login_required, :only => [ :show, :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Account created!'
      continue_or_redirect_to root_path
    else
      render :action => :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Account updated!'
      redirect_to root_path
    else
      render :action => :edit
    end
  end

end
