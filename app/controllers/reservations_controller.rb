class ReservationsController < ApplicationController
  before_action :set_user_place, only: [:create, :new]
  before_action :set_reservation, only: [:show, :update, :edit, :destroy]

  def index
    @parent_reservations = current_user.parent_reservations
    @babysitter_reservations = current_user.babysitter_reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create

    @reservation = Reservation.new(reservation_params)
    @reservation.user_place = @user_place
    @reservation.parent = current_user
    # @reservation.babysitter = 
    if @reservation.save
      redirect_to reservations_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_user_place
    @user_place = UserPlace.find(params[:user_place_id])
  end

  def set_reservation
    @reservation = @reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservations).permit(:start, :end, :number_of_kids)
  end
end
