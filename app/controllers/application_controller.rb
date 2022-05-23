class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    @user = current_user
    tops_path(@user)
  end
  
  def after_sign_out_path_for(resource)
    tops_path
  end

  # protect_from_forgery with: :exception

  # add_flash_types :success, :info, :warning, :danger

  # helper_method :current_user, :logged_in?, :log_in

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  # def logged_in?
  #   !current_user.nil?
  # end

  # def authenticate_user
  #   if @current_user == nil
  #     # flash[:notice] = "ログインが必要です"
  #     redirect_to("/login")
  #   end
  #   binding.pry
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:email]) # 新規登録時(sign_up時)にemailというキーのパラメーターを追加で許可する
  end
  
end
