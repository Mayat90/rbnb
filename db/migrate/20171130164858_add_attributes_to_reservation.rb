class AddAttributesToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :address, :string
    add_column :reservations, :domicile, :boolean
    add_column :reservations, :confirm, :boolean
  end
end
