json.extract! purchase, :id, :user_id, :course_id, :quantity, :price, :cart_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
