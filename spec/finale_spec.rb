
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The gand finale (last spec)" do

	include WeatherConditions

	let(:airport) { Airport.new }

  	it 'all planes can land and all planes can take off' do
  		expect(airport.plane_count).to eq 0
  		plane1 = Plane.new
  		expect(plane1.flying?).to be true
  		plane2 = Plane.new
  		expect(plane2.flying?).to be true
  		plane3 = Plane.new
  		expect(plane3.flying?).to be true
  		plane4 = Plane.new
  		expect(plane4.flying?).to be true
  		plane5 = Plane.new
  		expect(plane5.flying?).to be true
  		plane6 = Plane.new
  		expect(plane6.flying?).to be true
  		
  		allow(airport).to receive(:weather_conditions).and_return("stormy")
  		expect{ airport.land(plane1) }.to raise_error("You cannot land in a storm!")
  		allow(airport).to receive(:weather_conditions).and_return("stormy")
  		expect{ airport.land(plane2) }.to raise_error("You cannot land in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
  		expect{ airport.land(plane3) }.to raise_error("You cannot land in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
  		expect{ airport.land(plane4) }.to raise_error("You cannot land in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
  		expect{ airport.land(plane5) }.to raise_error("You cannot land in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.land(plane6) }.to raise_error("You cannot land in a storm!")

			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane1)
			expect(airport.plane_count).to eq 1
			expect(plane1.flying?).to be false
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane2)
			expect(airport.plane_count).to eq 2
			expect(plane2.flying?).to be false
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane3)
			expect(airport.plane_count).to eq 3
			expect(plane3.flying?).to be false
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane4)
			expect(airport.plane_count).to eq 4
			expect(plane4.flying?).to be false			
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane5)
			expect(airport.plane_count).to eq 5
			expect(plane5.flying?).to be false
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.land(plane6)
			expect(airport.plane_count).to eq 6
			expect(plane6.flying?).to be false

			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane1) }.to raise_error("You cannot take off in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane2) }.to raise_error("You cannot take off in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane3) }.to raise_error("You cannot take off in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane4) }.to raise_error("You cannot take off in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane5) }.to raise_error("You cannot take off in a storm!")
			allow(airport).to receive(:weather_conditions).and_return("stormy")
			expect{ airport.take_off(plane6) }.to raise_error("You cannot take off in a storm!")

			expect(airport.plane_count).to eq 6
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane1)
			expect(airport.plane_count).to eq 5
			expect(plane1.flying?).to be true
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane2)
			expect(airport.plane_count).to eq 4
			expect(plane2.flying?).to be true
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane3)
			expect(airport.plane_count).to eq 3
			expect(plane3.flying?).to be true
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane4)
			expect(airport.plane_count).to eq 2
			expect(plane4.flying?).to be true
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane5)
			expect(airport.plane_count).to eq 1
			expect(plane5.flying?).to be true
			allow(airport).to receive(:weather_conditions).and_return("sunny")
			airport.take_off(plane6)
			expect(airport.plane_count).to eq 0
			expect(plane6.flying?).to be true
  end
end