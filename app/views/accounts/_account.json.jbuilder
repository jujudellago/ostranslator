json.extract! account, :id, :name, :api_key, :api_secret, :enabled, :comments, :created_at, :updated_at
json.url account_url(account, format: :json)
