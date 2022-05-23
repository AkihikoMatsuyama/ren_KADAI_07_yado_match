class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # メール認証なし
    @user.skip_confirmation!
    if @user.save
      flash[:success] = "アカウントを新規登録しました。"
      sign_in @user
      redirect_to myprofile_path(@user)
    else
      flash.now[:failure] = "アカウントが登録できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  # end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

end
