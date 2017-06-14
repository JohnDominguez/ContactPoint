class Course < ApplicationRecord
	has_many :carts
	has_many :course_ratings
	has_many :sold_courses
end
