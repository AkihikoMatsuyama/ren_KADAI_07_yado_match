class RoomsController < ApplicationController

  def index
    @user = current_user
    @rooms = Room.where(user_id: @user.id)
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "部屋を新規登録しました。"
      redirect_to rooms_path(@user)
    else
      flash.now[:failure] = "部屋を新規登録できませんでした。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = current_user
  end

  def search
    @user = current_user
    @post = params
    if @post[:search_area].blank? && @post[:search_word].blank?
      @rooms = Room.all
    elsif @post[:search_area].present? && @post[:search_word].blank?
      @rooms = Room.where("address LIKE?", "%#{@post[:search_area]}%")
    elsif @post[:search_area].blank? && @post[:search_word].present?
      @rooms = Room.where("name LIKE?", "%#{@post[:search_word]}%")
        .or(Room.where("profile LIKE?", "%#{@post[:search_word]}%"))
        .or(Room.where("money LIKE?", "%#{@post[:search_word]}%"))
        .or(Room.where("address LIKE?", "%#{@post[:search_word]}%"))
    elsif @post[:search_area].present? && @post[:search_word].present?
      @rooms = Room.where("address LIKE?", "%#{@post[:search_area]}%")
        .merge((Room.where("name LIKE?", "%#{@post[:search_word]}%"))
        .or(Room.where("profile LIKE?", "%#{@post[:search_word]}%"))
        .or(Room.where("money LIKE?", "%#{@post[:search_word]}%")))
    end
  end

  def room_params
    params.require(:room).permit(
      :name,
      :profile,
      :money,
      :address,
      :image,
      :user_id
      )
  end
end
