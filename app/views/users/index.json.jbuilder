json.array!(@users) do |user|
  json.extract! user, :id, :accountname, :facebook_token, :age, :name, :sex, :url, :passport_id, :password_digest
  json.url user_url(user, format: :json)
end
