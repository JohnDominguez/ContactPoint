class CreateSoldProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :sold_products do |t|
      t.belongs_to :users, foreign_key: true
      t.belongs_to :products, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
