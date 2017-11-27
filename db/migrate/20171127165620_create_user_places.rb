class CreateUserPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :user_places do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :photo
      t.integer :capacity
      t.float :price

      t.timestamps
    end
  end
end
