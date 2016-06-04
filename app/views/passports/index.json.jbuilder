json.array!(@passports) do |passport|
  json.extract! passport, :id, :passport, :lastupdated
  json.url passport_url(passport, format: :json)
end
