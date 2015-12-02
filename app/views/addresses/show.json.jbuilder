json.address do
  json.user_id @address.user_id
 	json.address_id @address.id
 	json.street_address @address.address
 	json.city @address.city
 	json.state @address.state
 	json.zip @address.zip
end