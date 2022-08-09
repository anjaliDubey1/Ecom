class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :seller, :boolean
    add_column :users, :token, :string
  end
end
