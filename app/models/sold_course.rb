class SoldCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :cart
end
