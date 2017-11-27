class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :babysitter_content
      t.integer :babysitter_stars
      t.string :parent_content
      t.integer :parent_stars

      t.timestamps
    end
  end
end
