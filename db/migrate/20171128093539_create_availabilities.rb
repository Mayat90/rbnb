class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.timestamp :start
      t.timestamp :end
      t.references :user_place, foreign_key: true

      t.timestamps
    end
  end
end
