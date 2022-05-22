class Users::SessionsController < Devise::SessionsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user = User.find_by_email(@user.email)
    if @user && @user.valid_password?(params[:user][:password])
      sign_in @user
      flash[:success]="ログイン成功しました。"
      redirect_to mytop_path(@user)
    else
      flash.now[:failure] = "メールアドレスかパスワードが無効です"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    flash[:success]="ログアウトしました。"
    sign_out @user
    redirect_to tops_path
  end

  def show_mypage
    @user = current_user
  end
  
  def show_myprofile
    @user = current_user
  end

  def show_myaccount
    @user = current_user
  end

  def edit_myaccount
    @user = current_user
  end

  # def update_myaccount
  #   @user = current_user
  #   @post = User.new
  #   @post = User.new(post_params_myaccount)
  #   # メール認証なし
  #   @user.skip_confirmation!
  #   if !params[:user][:email].blank? && !params[:user][:password].blank? && !params[:user][:password_confirmation].blank? && !params[:user][:password_now].blank?
  #     @post = params
  #     if @user.valid_password?(params[:user][:password_now])
  #       # @user.update(email: @post[:user][:email])
  #       @user.update(user_params_myaccount)
  #       redirect_to myaccount_path(@user)
  #     else
  #     end
  #   else
  #   end
  # end

  def update_myprofile
    @user = current_user
    if @user.update(user_params_myprofile)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to myprofile_path(@user)
    else
      flash.now[:failure] = "プロフィールを更新できませんでした。"
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :image,
      :profile
    )
  end

  def user_params_myprofile
    params.require(:user).permit(
      :name,
      :image,
      :profile
    )
  end

  def user_params_myaccount
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def post_params_myaccount
    params.permit(
      :email,
      :password,
      :password_confirmation,
      :password_now
    )
  end

end
