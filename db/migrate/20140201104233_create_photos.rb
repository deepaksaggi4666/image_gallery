class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
       t.has_attached_file :image
       t.integer :album_id
      t.timestamps
    end
  end
end
