class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
