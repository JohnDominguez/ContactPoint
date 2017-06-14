class User < ApplicationRecord
  has_many :carts
  has_many :product_carts
  has_many :sold_products
  has_many :sold_courses
  has_many :product_raitings
  has_many :course_raitings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
