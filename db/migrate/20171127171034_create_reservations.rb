class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user_place, foreign_key: true
      t.references :parent, foreign_key: { to_table: :users }, index: true
      t.references :babysitter, foreign_key: { to_table: :users }, index: true
      t.timestamp :start
      t.timestamp :end
      t.integer :NumberOfKid
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end

