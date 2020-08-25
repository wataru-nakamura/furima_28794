class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :postal_code, null: false
      t.integer :prefectures_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.integer :product_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
