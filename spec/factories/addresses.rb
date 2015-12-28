FactoryGirl.define do
  factory :address do
    user_id 8
    address "123 Gold Lane SE"
    city "Smyrna"
    state "Ga"
    zip 30080
    longitude 30.456
    latitude -84.67
  end
end
