class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.integer :user_id
      t.string :name
      t.string :bio
      t.string :img

      t.timestamps
    end
  end
end
