class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :image,               null: false
      t.string  :name,                null: false
      t.text    :explanation,         null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :shipping_fee_id,     null: false
      t.integer :shipping_origin_id,  null: false
      t.integer :shipping_price_id,   null: false
      t.string  :selling_price,       null: false
      t.integer :user_id,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
