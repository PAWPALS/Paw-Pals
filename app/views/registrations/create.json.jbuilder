json.user do
	json.user_id @user.id
	json.email @user.email
	json.access_token @user.access_token
end