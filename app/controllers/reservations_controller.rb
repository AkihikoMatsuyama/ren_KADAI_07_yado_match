class ReservationsController < ApplicationController

  def new
    @user = current_user
    @room = Room.find(params[:rm_id])
    @post = Reservation.new
    @reservation = Reservation.new
    @post = Reservation.new(post_params)
    if @post.save
      @stay_day = (@post[:end_day].to_date-@post[:start_day].to_date).to_i
      @total_money = @stay_day * @post[:person].to_i * @post[:money].to_i
    else
      @post.valid?
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @user = current_user
    @reservations = Reservation.where(user_id: @user.id)
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reserve_params)
    @room = Room.find(@reservation[:rm_id])
    if @reservation.save
      redirect_to reservation_path(@reservation)
      flash[:success] = "ルームを新規登録しました。"
    else
      flash.now[:failure] = "ルームを新規登録できませんでした。"
    end
  end

  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation[:rm_id])
  end

  def reserve_params
    params.require(:reservation).permit(
      :rm_id,
      :money,
      :start_day,
      :end_day,
      :person,
      :price,
      :user_id
    )
  end

  def post_params
    params.permit(
      :rm_id,
      :start_day,
      :end_day,
      :person,
      :money
    )
  end

end
