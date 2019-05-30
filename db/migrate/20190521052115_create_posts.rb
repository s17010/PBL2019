class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :problem
      t.string :latitude
      t.string :longitude
      t.boolean :display

      t.timestamps
    end
  end
end
