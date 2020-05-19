json.extract! event, :id, :title, :body, :category, :start_at, :end_at, :user, :created_at, :updated_at
json.url event_url(event, format: :json)
