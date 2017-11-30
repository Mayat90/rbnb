class ProfileController < ApplicationController
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
  end

private
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :iban, :number_of_kids,:babysitter, :description, :photo, :cphoto)
  end

end

