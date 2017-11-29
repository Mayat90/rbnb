class UserPlacesController < ApplicationController

  before_action :set_user_place, only: [:show, :edit, :update, :destroy]
  def index
    @user_places = current_user.user_places
  end

  def show
  end

  def new
    @user_place = UserPlace.new
  end

  def create
    @user_place = UserPlace.new(user_place_params)
    if @user_place.save
      redirect_to user_place_path(@user_place)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user_place.update_attributes(user_place_params)
    redirect_to user_place_path(@user_place)
  end

  def destroy
    @user_place.destroy
    redirect_to user_places_path
  end

  private

  def set_user_place
    @user_place = current_user.user_places.find(params[:id])
  end

  def user_place_params
    params.require(:user_place).permit(:address, :capacity, :price)
  end
end
