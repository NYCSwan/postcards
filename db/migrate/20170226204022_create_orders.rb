class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ordered_item_type
      t.integer :ordered_item_id
      t.integer :quantity, 			default: 1
      t.decimal :unit_price, 		precision: 8, scale: 2
      t.decimal :tax_rate, 			precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
