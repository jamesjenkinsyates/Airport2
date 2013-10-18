class Plane 

  def initialize
    @flying = true
    @landed = false
  end

  def flying?
    @flying
  end

  def land_at airport
    @flying = false
    @landed = true
    airport.permission_to_land(self)
  end

  def take_off_from airport
    initialize
    airport.permission_to_take_off(self)
  end



end