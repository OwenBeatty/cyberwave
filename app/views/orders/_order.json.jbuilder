json.extract! order, :id, :user_id, :status, :address, :total, :note, :created_at, :updated_at
json.url order_url(order, format: :json)
