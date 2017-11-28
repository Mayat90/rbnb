class AddNameToUserPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :user_places, :name, :string
  end
end
