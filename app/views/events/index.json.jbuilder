json.array! @events, partial: "events/event", as: :event
json.array!(@events) do |event|
  json.extract! event, :id, :title, :body
  json.start event.start_at
  json.end event.end_at
  json.url event_url(event, format: :html)
  # json.category
  if event.category.present?
    json.category event.category
  else
    json.category ""
  end
end
