json.extract! account, :id, :website, :email, :user_name, :password, :created_at, :updated_at
json.url account_url(account, format: :json)