json.user do 
	json.extract! @user, :email, :access_token, :address
end
