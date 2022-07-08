json.extract! event, :id, :title, :body, :start_date, :end_date, :price, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
