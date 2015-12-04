json.pet_notices @pet_notices do |notice|
	json.pet_id notice.pet_id
	json.longitude notice.longitude 
	json.latitude notice.latitude 
	json.created_at notice.created_at
 end