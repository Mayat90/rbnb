class AddCoordinatesToUserPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :user_places, :latitude, :float
    add_column :user_places, :longitude, :float
  end
end
