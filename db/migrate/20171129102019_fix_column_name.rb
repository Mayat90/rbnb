class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :NumberOfKid, :number_of_kids
  end
end
