json.array!(@hall_attachments) do |hall_attachment|
  json.extract! hall_attachment, :id, :hall_id, :photo
  json.url hall_attachment_url(hall_attachment, format: :json)
end
