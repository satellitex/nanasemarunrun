json.array!(@photos) do |photo|
  json.extract! photo, :id, :room_id, :img, :represent
  json.url photo_url(photo, format: :json)
end
