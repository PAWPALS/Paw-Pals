json.pet_check_in do
	json.pet_id @pet_check_in.pet_id
	json.longitude @pet_check_in.longitude
	json.latitude @pet_check_in.latitude
	json.adafruit_created_at @pet_check_in.adafruit_created_at
	json.created_at @pet_check_in.created_at
end