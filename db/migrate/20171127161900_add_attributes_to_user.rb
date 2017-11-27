class AddAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :iban, :string
    add_column :users, :number_of_kids, :integer
    add_column :users, :babysitter, :boolean
    add_column :users, :photo, :string
  end
end
