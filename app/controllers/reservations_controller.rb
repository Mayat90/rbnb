class ReservationsController < ApplicationController
  before_action :set_user_place, only: [:create, :new]
  before_action :set_reservation, only: [:show, :update, :edit, :destroy]


  def index
    @class = ["tab-active", "tab"]
    @reservations = current_user.parent_reservations
  end

  def indexb
    @class = ["tab", "tab-active"]
    @reservations = current_user.babysitter_reservations
    render ('index')
  end

  def new
    session['babysitter'] = params['baby'].to_i
    @babysitter = User.find(session['babysitter'])

    session['address'] = params["address"] if params["address"]
    session['start']= params["start"] if params["start"]
    session['end']= params["end"] if params["end"]
    session['number_of_kids']= params["number_of_kids"] if params["number_of_kids"]
    p session['domicile']
    if session['domicile']
      session['address'] = current_user.address
      @garde = "Pour venir chez moi (#{session['address']}) garder"
    else
      session['address'] = @babysitter.address
      @garde = "Pour prendre en garde à son domicile (#{session['address']})"
    end
    @reservation = Reservation.new(
      parent: current_user,
      babysitter: @babysitter,
      number_of_kids: session['number_of_kids'],
      address: session['address'],
      start: session['start'],
      end: session['end'],
      domicile: session['domicile'],
      confirm: false,
      )
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.start = timeconvert(reservation_params[:start])
    @reservation.end = timeconvert(reservation_params[:end])

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

  def timeconvert(str)
    t = str.split(' ')
    t2 = t[0].split('-')
    "20" + t2[2] + "-" + t2[1] + "-" + t2[0] + " " + t[1]

  end

  def set_user_place
    # @user_place = UserPlace.find(params[:user_place_id])
  end

  def set_reservation
    @reservation = @reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:parent_id, :babysitter_id, :address,:start, :end, :number_of_kids, :domicile, :confirm)
  end
end
