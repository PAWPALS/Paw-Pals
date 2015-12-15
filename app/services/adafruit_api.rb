class AdafruitApi

    include HTTParty
    base_uri "https://io.adafruit.com"

    def initialize()
      @key = {
          "X-AIO-Key" => ENV["X-AIO-Key"] 
      }
    end     

    def get_coordinates()
      response = AdafruitApi.get("/api/feeds/location/data", headers: @key)     
      coordinates = response.first(5)
      c = coordinates.map do |api| {id: api["id"], lat: api["lat"], long: api["lon"], time: api["created_at"].to_time}
      end      
   end
end

   

# @pet_checkins = PetCheckIn.last(5)
# p = @pet_checkins.map do |record| {id: record["adafruit_id"], lat: record["latitude"], long: record["longitude"], time: record["adafruit_created_at"].to_time}
# end
# c.each_with_index {|h, i| h.delete_if {|k,v| p[i].has_key?(k) && p[i][k] == v }}