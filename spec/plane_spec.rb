require 'plane'

describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end
  
  it 'has a flying status when in the air' do
    expect(plane).to be_flying
    plane.land
    expect(plane).not_to be_flying
  end
  
  it 'can take off' do
    plane.land
    plane.take_off
    expect(plane).to be_flying
  end
  
  it 'changes its status to flying after taking of' do
    plane.land
    expect(plane).not_to be_flying
    plane.take_off
    expect(plane).to be_flying
  end
end