class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
