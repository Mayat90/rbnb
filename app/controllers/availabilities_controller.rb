class AvailabilitiesController < ApplicationController
  before_action :set_user_place, only: [:new, :create, :destroy]
  before_action :set_availability, only: [:update, :edit, :destroy]

  # pas besoin d'index à priori on iterera user_place.availabilities dans le show de user_place

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    @availability.user_place = @user_place
    if @availability.save
      redirect_to user_place_path(@user_place)
    else
      render 'user_places/show'
    end
  end

  def edit
  end

  def update
    if @availability.update(availability_params)
      redirect_to user_place_path(@user_place)
    else
      render 'user_places/show'
    end
  end

  def destroy
    @availability.destroy
    redirect_to user_place_path(@user_place)
  end

  private

  def set_user_place
    @user_place = User_place.find(params[:user_place_id])
  end

  def set_availability
    @availability = Abvailability.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:start, :end)
  end

end
