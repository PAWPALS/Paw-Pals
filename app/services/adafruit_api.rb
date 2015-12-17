class AdafruitApi

    include HTTParty
    base_uri "https://io.adafruit.com"

    def initialize()
      @key = {
          "X-AIO-Key" => ENV["X-AIO-Key"] 
      }
    end     

    def get_coordinates(last_checkin)
      adafruit_id = last_checkin.map{|x| x[:adafruit_id]}
      response = AdafruitApi.get("/api/feeds/location/data", headers: @key)     
      coordinates = response.first(5).reject { |x| x[:id] = adafruit_id}
      coordinates.map do |api|
        {id: api["id"], lat: api["lat"], long: api["lon"], time: api["created_at"].to_time}
      end 
   end
end
