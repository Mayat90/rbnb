class ProfileController < ApplicationController
  def show
    p current_user.user_places
  end

  def edit
  end

  def update
  end
end
