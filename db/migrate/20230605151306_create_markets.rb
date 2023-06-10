class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|

      t.timestamps

      t.string :name,                null: false
      t.text :explanation,           null: false 
      t.integer :price,              null: false
      t.integer :category_id,        null: false
      t.integer :detail_id,          null: false
      t.integer :shipping_price_id,  null: false
      t.integer :prefecture_id,      null: false
      t.integer :shipping_date_id,   null: false
      t.references :user,            null: false , foreign_key: true

    end
  end
end
