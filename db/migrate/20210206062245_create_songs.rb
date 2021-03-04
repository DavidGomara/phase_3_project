class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.integer :album_id
      t.integer :genre_id
      t.string :name
      t.integer :min
      t.integer :sec

      t.timestamps
    end
  end
end
