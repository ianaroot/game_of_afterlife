module Pathfinder
  extend self
  def move_towards friendly_location, speed
    y_difference = friendly_location.fetch(:y) - position.fetch(:y)
    x_difference = friendly_location.fetch(:x) - position.fetch(:x)
    length = distance_to friendly_location
    return friendly_location if speed > 0 && length < speed
    {
      x: position.fetch(:x) + x_difference / length * speed ,
      y: position.fetch(:y) + y_difference / length * speed
    }
  end

  def move_away_from hostile_location, speed
    move_towards hostile_location, -speed
  end

  def move_perpendicular_to friendly_location, speed
    y_difference = friendly_location.fetch(:y) - position.fetch(:y)
    x_difference = friendly_location.fetch(:x) - position.fetch(:x)
    length = distance_to friendly_location
    return friendly_location if speed > 0 && length < speed
    {
      x: position.fetch(:x) + y_difference / length * speed ,
      y: position.fetch(:y) - x_difference / length * speed
    }
  end

  def distance_to other_location
    y_difference = other_location.fetch(:y) - position.fetch(:y)
    x_difference = other_location.fetch(:x) - position.fetch(:x)
    Math.sqrt(y_difference**2 + x_difference**2)
  end

  def move_randomly
    angle = rand * 2*Math::PI
    {
      x: position.fetch(:x) + Math.cos(angle) * speed,
      y: position.fetch(:y) + Math.sin(angle) * speed
    }
  end
end
