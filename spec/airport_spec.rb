require 'airport'
require 'plane'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, land!: true, take_off!: true }
  
  context 'taking off and landing' do
    it 'a plane can land' do
      expect(airport).to receive(:permission_to_land)
      airport.permission_to_land(plane)
    end
    
    it 'a plane can take off' do
      airport.permission_to_land(plane)
      expect(airport).to receive(:permission_to_take_off)
      airport.permission_to_take_off(plane)
    end

    it 'airport has 1 plane after plane has landed' do
      airport.permission_to_land(plane)
      expect(airport.planes_landed).to eq 1
    end

    it 'airport has 0 plane after plane has taken off' do
      airport.permission_to_land(plane)
      airport.permission_to_take_off(plane)
      expect(airport.planes_landed).to eq 0
    end

  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      6.times { airport.permission_to_land(plane) }
      expect(lambda { airport.permission_to_land(plane) }).to raise_error(RuntimeError)  
    end

    it 'can tell how many planes are at the airport' do
      3.times { airport.permission_to_land(plane) }
      expect(airport.planes_landed).to eq 3
    end

    it 'knows if the airport is full' do
      6.times { airport.permission_to_land(plane) }
      expect(airport).to be_full
    end
    
# Include a weather condition using a module.
# The weather must be random and only have two states "sunny" or "stormy".
# Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
# 
# This will require stubbing to stop the random return of the weather.
# If the airport has a weather condition of stormy,
# the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'randomiser will produce number between 0 and 100' do
        expect(airport.weather_randomiser).to be >= 0 
        expect(airport.weather_randomiser).to be <= 100
      end

      it 'a plane cannot take off when there is a storm brewing' do
        airport = Airport.new [plane]
        airport.stub(:weather_randomiser).and_return(5)
        expect(lambda { airport.plane_take_off(plane) }).to raise_error(RuntimeError) 
      end
      
      it 'a plane cannot land in the middle of a storm' do
        airport = Airport.new []
        airport.stub(:weather_randomiser).and_return(5)
        expect(lambda { airport.plane_land(plane) }).to raise_error(RuntimeError) 
      end
    end
  end
end