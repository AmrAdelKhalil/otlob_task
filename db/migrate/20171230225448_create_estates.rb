class CreateEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :estates do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :state, null: false
      t.integer :beds, default: 1
      t.integer :baths, default: 1
      t.float :sq_ft, null: false
      t.string :estate_type, null: false
      t.date :sale_date
      t.float :price, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
    end
  end
end
