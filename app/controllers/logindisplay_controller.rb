class LogindisplayController < ApplicationController
  # before_filter :check_login

  # def check_login
    # redirect_to logout_path if current_user && current_user.active_flag != 'active'
  # end
  
  def index
  end

  def create
  
  
  end

  def show
  end

  def edit
  end

  def destroy
    binding.pry
    # User.delete(:user_id)
    # @current_user = nil
    # render template: "tops/new"
    render index
  end
  

  

end
