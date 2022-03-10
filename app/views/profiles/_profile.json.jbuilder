json.extract! profile, :id, :first_name, :last_name, :location, :genre, :cellphone, :bank_account, :bank_money, :birth, :created_at, :updated_at
json.url profile_url(profile, format: :json)
