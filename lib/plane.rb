class Plane 

  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    @flying
  end

  def land! 
    @flying = false
    @landed = true
  end

  def take_off!
    initialize
  end



end