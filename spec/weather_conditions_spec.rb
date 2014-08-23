require 'weather_conditions'

class Weather; include WeatherConditions end

describe WeatherConditions do

	it "should know what the weather is" do
		check_weather = Weather.new
		expect(["sunny", "stormy"]).to include(check_weather.weather_conditions)
	end
end