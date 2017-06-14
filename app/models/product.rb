class Product < ApplicationRecord
	has_many :product_stocks
	has_many :product_ratings
	has_many :product_carts
	has_many :sold_products
end
