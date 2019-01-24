json.array!(@events) do |event|
  # json.extract! event, :id, :field_id
  json.id "#{event.id}"
  json.title "#{Field.find(event.field_id).name}"
  json.start event.start_time
  json.end event.end_time
  json.url root_url(format: :html)
end
