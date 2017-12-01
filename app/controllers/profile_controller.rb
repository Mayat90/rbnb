class ProfileController < ApplicationController
  def index
    session['address']= params["address"] if params["address"]
    session['start']= params["start"] if params["start"]
    session['end']= params["end"] if params["end"]
    session['number_of_kids']= params["number_of_kids"] if params["number_of_kids"]
    if params["domicile"]
      session['domicile']= false if params["domicile"].include?("no")
      session['domicile']= true if params["domicile"].include?("yes")
    end
    session['domicile'] ? @garde = "babysitter" : @garde = "garde"


    @search_address = Geocoder.coordinates(session['address'])
    @users = User.where.not(latitude: nil, longitude: nil).near(@search_address, 10)

    @markers = Gmaps4rails.build_markers(@users) do |user_place, marker|
      marker.lat user_place.latitude
      marker.lng user_place.longitude
      marker.infowindow content_info_window(user_place)
    end

    @markers << {lat: @search_address[0], lng: @search_address[1], infowindow: "Your Search </br>#{session['address']}"}

  end

  def show
  end

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render 'edit'
    end
  end

private
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :iban, :number_of_kids,:babysitter, :description, :photo, :cphoto, :address, :capacity, :garde_a_domicile)
  end

  def content_info_window(user)
    return "<a href='/resaconfirm?baby=#{user.id}'>Babysitter: #{user.first_name} #{user.last_name}<br/> #{user.address}  </a>"
  end

end

