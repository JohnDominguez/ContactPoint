class CreateSoldCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :sold_courses do |t|
      t.float :quantity
      t.float :price
      t.belongs_to :user, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
