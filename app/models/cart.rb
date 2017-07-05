class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :purchases, dependent: :destroy
end
