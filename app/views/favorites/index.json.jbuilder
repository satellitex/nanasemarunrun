json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :room_id, :user_id, :senddate
  json.url favorite_url(favorite, format: :json)
end
