json.extract! product, :id, :name, :description, :price, :gluten_free, :dairy_free, :contains_peanuts, :featured, :created_at, :updated_at
json.url product_url(product, format: :json)
