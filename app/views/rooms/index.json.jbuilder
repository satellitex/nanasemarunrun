json.array!(@rooms) do |room|
  json.extract! room, :id, :user_id, :address_id
  json.url room_url(room, format: :json)
end
