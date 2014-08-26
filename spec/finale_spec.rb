require 'airport'
require 'plane'
require 'weather_conditions'

describe "The gand finale (last spec)" do

	include WeatherConditions

	let(:airport) { Airport.new   }
	let(:plane)   { double :plane }

  	it 'all planes can land and all planes can take off' do

  		plane1 = Plane.new
  		plane2 = Plane.new
  		plane3 = Plane.new
  		plane4 = Plane.new
  		plane5 = Plane.new
  		plane6 = Plane.new

  		airplanes = [plane1, plane2, plane3, plane4, plane5, plane6]

  		airplanes.each do |airplane|
  			expect(airplane.flying?).to be true
  		end
  		
  		allow(airport).to receive(:weather_conditions).and_return("stormy")
  		airplanes.each do |airplane|
  			expect{ airport.land(airplane) }.to raise_error("You cannot land in a storm!")
  		end

  		expect(airport.plane_count).to eq 0
		allow(airport).to receive(:weather_conditions).and_return("sunny")
		airplanes.each do |airplane|
			airport.land(airplane)
			expect(airplane.flying?).to be false
		end
		expect(airport.plane_count).to eq 6

		expect(airport).to be_full
		allow(airport).to receive(:weather_conditions).and_return("sunny")
		expect{ airport.land(plane) }.to raise_error("Airport is full")

		allow(airport).to receive(:weather_conditions).and_return("stormy")
		airplanes.each do |airplane|
			expect{ airport.take_off(airplane) }.to raise_error("You cannot take off in a storm!")
		end

		expect(airport.plane_count).to eq 6
		allow(airport).to receive(:weather_conditions).and_return("sunny")
		airplanes.each do |airplane|
			airport.take_off(airplane)
			expect(airplane.flying?).to be true
		end
		expect(airport.plane_count).to eq 0
  end
end