json.array!(@controllers) do |controller|
  json.extract! controller, :id, :Halls
  json.url controller_url(controller, format: :json)
end
