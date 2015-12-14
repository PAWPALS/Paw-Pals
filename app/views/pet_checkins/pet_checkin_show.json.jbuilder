json.pet_check_ins @pet_check_ins do |checkin|
	json.pet_id checkin.pet_id
	json.longitude checkin.longitude 
	json.latitude checkin.latitude 
	json.adafruit_created_at checkin.adafruit_created_at
	json.created_at checkin.created_at
 end



