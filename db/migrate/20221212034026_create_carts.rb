class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :product
      t.integer :quantity
      t.boolean :active

      t.timestamps
    end
  end
end
