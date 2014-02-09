require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position, :time_since_infection

  def initialize(attributes = {})
    @position = attributes[:position] || {x: (5 + rand(791)), y: (5 + rand(791))}
    @speed = attributes[:speed]
    @type = attributes[:type]
  end

  def move_nearest(nearest_object)
    attracted?(nearest_object) ?
     move_towards(position, nearest_object.position, speed) :
     move_away(position, nearest_object.position, speed)
  end

  def attracted?(nearest_object)
    case type
    when :human
      !(nearest_object.type == :zombie)
    when :zombie
      nearest_object.type == :human || nearest_object.type = :infected_human
    end
  end

  def get_bitten
    self.type = :infected_human
    self.speed = 0
    self.time_since_infection = 0
  end

  def turn_to_zombie
    self.type = :zombie
    self.speed = 5
  end
end
