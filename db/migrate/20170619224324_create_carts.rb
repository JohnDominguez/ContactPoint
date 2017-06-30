class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
