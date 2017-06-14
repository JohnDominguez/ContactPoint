class CreateProductStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :product_stocks do |t|
      t.belongs_to :suppliers, foreign_key: true
      t.belongs_to :products, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
