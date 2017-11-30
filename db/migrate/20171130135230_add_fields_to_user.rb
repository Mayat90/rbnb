class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :garde_a_domicile, :boolean
    add_column :users, :capacity, :integer
    add_column :users, :address, :string
  end
end
