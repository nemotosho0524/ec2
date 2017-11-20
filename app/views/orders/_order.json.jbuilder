json.extract! order, :id, :user_id, :post_id, :order_name, :tel, :email, :address, :created_at, :updated_at
json.url order_url(order, format: :json)
