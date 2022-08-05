class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name
      t.decimal :price
      t.integer :stok
      t.timestamps
    end
  end
end
