require_relative 'weather_mod'

class Airport

include Weather

  def initialize planes = [], capacity = 6
    @planes = planes
    @capacity = capacity
  end

  def planes_landed
    @planes.count
  end

  def full?
    planes_landed == @capacity
  end

  def plane_land plane
    @planes << plane
  end

  def permission_to_land plane
    raise "Too Stormy!" if weather == 'Stormy'
    raise "Airport is full" if full?
    plane_land plane
  end

  def plane_take_off plane
    @planes.delete_if {| taking_off | taking_off == plane }
  end

  def permission_to_take_off plane
    raise "Too Stormy!" if weather == 'Stormy'
    plane_take_off plane
  end





end