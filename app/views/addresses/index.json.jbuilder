json.array!(@addresses) do |address|
  json.extract! address, :firstName, :lastName, :email
  json.url address_url(address, format: :json)
end
