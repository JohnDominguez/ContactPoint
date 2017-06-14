class CreateCourseRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :course_ratings do |t|
      t.boolean :like
      t.belongs_to :courses, foreign_key: true
      t.belongs_to :users, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
