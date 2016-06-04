json.array!(@addresses) do |address|
  json.extract! address, :id, :country, :city, :prefectures
  json.url address_url(address, format: :json)
end
