json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :provider, :oauth_token, :oauth_expires_at
  json.url user_url(user, format: :json)
end
