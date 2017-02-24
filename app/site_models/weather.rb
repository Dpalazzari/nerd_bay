class Weather

  attr_reader :conditions, 
              :description, 
              :temp, 
              :max_temp, 
              :min_temp, 
              :wind_speed, 
              :visibility

  def initialize(attributes={})
    @conditions  = attributes[:weather].first[:main]
    @description = attributes[:weather].first[:description]
    @temp        = attributes[:main][:temp]
    @max_temp    = attributes[:main][:temp_max]
    @min_temp    = attributes[:main][:temp_min]
    @wind_speed  = attributes[:wind][:speed]
    @visibility  = attributes[:visibility]
  end

  def self.get_data(city)
    weather = WeatherService.get_data(city)
    new(weather)
  end

end