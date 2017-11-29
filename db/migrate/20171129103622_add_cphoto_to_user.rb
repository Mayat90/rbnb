class AddCphotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cphoto, :string
  end
end
