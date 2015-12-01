json.pets @pets do |pet|
  json.user_id pet.user_id
 	json.pet_id pet.id
 	json.name pet.name
 	json.age pet.age
 	json.breed pet.breed
 	json.description pet.description
 	json.present pet.present
end