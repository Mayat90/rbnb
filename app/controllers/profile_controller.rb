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

private
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :email, :iban, :number_of_kids,:babysitter, :description, :photo, :cphoto)
  end

end
