require 'airport'
require 'plane'

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
    airport = Airport.new
    plane = Plane.new
    airport.stub(:weather_randomiser).and_return(50)
    airport.plane_land plane
    expect(plane).not_to be_flying
    airport.plane_take_off plane
    expect(plane).to be_flying
  end
end