class ProductCart < ApplicationRecord
	belongs_to :Product
	belongs_to :user
end
