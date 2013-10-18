require 'airport'
require 'plane'

# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  let(:airport) { Airport.new }

  it 'has a flying status when created' do
    expect(plane).to be_flying
  end
  
  it 'has a flying status when in the air' do
    expect(plane).to be_flying
  end
  
  it 'can take off' do
    airport.stub(:weather_randomiser).and_return(50)
    plane.land_at airport
    expect(plane).to receive(:take_off_from)
    plane.take_off_from airport
  end
  
  it 'changes its status to flying after taking of' do
    airport.stub(:weather_randomiser).and_return(50)
    plane.land_at airport
    expect(plane).not_to be_flying
    plane.take_off_from airport
    expect(plane).to be_flying
  end
end