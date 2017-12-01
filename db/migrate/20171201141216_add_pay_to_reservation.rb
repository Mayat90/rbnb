class AddPayToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :pay, :boolean
  end
end
