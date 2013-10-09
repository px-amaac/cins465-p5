json.array!(@addresses) do |address|
  json.extract! address, :firstName, :lastName, :email, :zipCode, :favoriteColor
  json.url address_url(address, format: :json)
end
