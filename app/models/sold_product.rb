class SoldProduct < ApplicationRecord
  belongs_to :users
  belongs_to :products
end
