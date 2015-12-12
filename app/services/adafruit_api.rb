class AdafruitApi

    include HTTParty
    base_uri "https://io.adafruit.com"

    def initialize()
      @key = {
          "X-AIO-Key" => ENV["ADAFRUIT_API_KEY"] 
      }
    end     

    def get_coordinates()
      response = AdafruitApi.get("/api/feeds/location/data", headers: @key)     
      coordinates = response.first(5)
      coordinates.map do |api| {lat: api["lat"], long: api["lon"], time: api["created_at"]}
        end
    end
  end

   


  