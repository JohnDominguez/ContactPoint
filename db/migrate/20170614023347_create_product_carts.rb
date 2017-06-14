class CreateProductCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :product_carts do |t|
      t.belongs_to :users
      t.belongs_to :products
      t.integer :quantity

      t.timestamps
    end
  end
end
