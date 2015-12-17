class AdafruitApi

    include HTTParty
    base_uri "https://io.adafruit.com"

    def initialize()
      @key = {
          "X-AIO-Key" => ENV["X-AIO-Key"] 
      }
    end     

    def get_coordinates(last_checkin)
      response = AdafruitApi.get("/api/feeds/location/data", headers: @key) 
     if last_checkin.empty?
        coordinates = response.first(5)
     else
        adafruit_id = last_checkin.map{|x| x[:adafruit_id]}  
        coordinates = response.first(5).reject { |x| x[:id] = adafruit_id}
     end
        coordinates.map do |api|
          {id: api["id"], lat: api["lat"], long: api["lon"], time: api["created_at"].to_time}
      end 
   end
end
