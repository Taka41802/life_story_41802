class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.text       :description
      t.date       :posted_date,    null: false
      t.references :album,          null: false, foreign_key: true
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
