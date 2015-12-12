json.lost_pets_coordinates @addresses do |address|
	json.user_id address.user_id
	json.latitude address.latitude
 	json.longitude address.longitude
 end

json.pets @pets do |pet|
 	json.user_id pet.user_id 
 	json.pet_id pet.id
end
