class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :address
      t.decimal :price, precision: 15, scale: 2
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6

      t.timestamps
    end
  end
end
