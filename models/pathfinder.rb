module Pathfinder
  extend self
  def move_towards(current, friendly_location, speed)
    y_difference = (friendly_location.fetch(:y) - current.fetch(:y)).abs
    x_difference = (friendly_location.fetch(:x) - current.fetch(:x)).abs
    length = Math.sqrt(y_difference**2 + x_difference**2)
    y_difference /= length
    x_difference /= length
    x_difference *= speed
    y_difference *= speed
    target = {
      x: ( current[:x] + x_difference ),
      y: ( current[:y] + y_difference )
      }
  end

  def move_away(current, hostile_location, speed)
    move_towards current, hostile_location, -speed
  end

end

