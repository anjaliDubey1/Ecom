class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :Product_id
      t.integer :stok
      t.integer :subtotal
      t.belongs_to :order
      t.timestamps
    end
  end
end
