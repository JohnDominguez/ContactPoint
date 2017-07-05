class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :purchases
end
