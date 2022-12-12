class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.integer :status
      t.integer :cash_paid

      t.timestamps
    end
  end
end
