require 'airport'
require 'plane'
require 'weather_conditions'
 
describe Airport do

  include WeatherConditions

  let(:airport) { Airport.new }
  let(:plane)   { Plane.new   }

  context 'taking off and landing' do

    it 'a plane can land' do
      expect(airport.plane_count).to eq 0
      allow(airport).to receive(:weather_conditions).and_return("sunny")
      airport.land(plane)
      expect(airport.plane_count).to eq 1
    end
    
    it 'a plane can take off' do
      allow(airport).to receive(:weather_conditions).and_return("sunny")
      airport.land(plane)
      allow(airport).to receive(:weather_conditions).and_return("sunny")
      airport.take_off(plane)
      expect(airport.plane_count).to eq 0
    end
  end
  
  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      expect(airport).not_to be_full
      allow(airport).to receive(:weather_conditions).and_return("sunny")
      6.times { airport.land(plane) }
      expect(airport).to be_full
      allow(airport).to receive(:weather_conditions).and_return("sunny")
      expect{ airport.land(plane) }.to raise_error("Airport is full")
    end

    context 'weather conditions' do

      it 'a plane cannot take off when there is a storm brewing' do
        allow(airport).to receive(:weather_conditions).and_return("stormy")
        expect{ airport.take_off(plane) }.to raise_error("You cannot take off in a storm!")
      end
      
      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:weather_conditions).and_return("stormy")
        expect{ airport.land(plane) }.to raise_error("You cannot land in a storm!")
      end
    end
  end
end
 
