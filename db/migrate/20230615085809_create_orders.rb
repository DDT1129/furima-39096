class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.timestamps

      t.references :user,            null: false , foreign_key: true
      t.references :market,          null: false , foreign_key: true
    end
  end
end
