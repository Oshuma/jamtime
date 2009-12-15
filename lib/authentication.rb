module Authentication

  def self.included(controller)
    helpers = [ :current_user, :current_user_session, :admin?, :logged_in? ]
    controller.send(:helper_method, *helpers)
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def admin?
    logged_in? && current_user.admin
  end

  def logged_in?
    !!current_user
  end

  # before_filter to ensure current_user is an administrator.
  def ensure_admin
    unless admin?
      redirect_to(root_path)
      return false
    end
  end

  # before_filter to ensure authenticated User.
  def login_required
    unless logged_in?
      store_location
      flash[:notice] = 'You must login first.'
      redirect_to(login_path)
      return false
    end
  end

  def continue_or_redirect_to(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def store_location
    session[:return_to] = request.request_uri
  end

end
