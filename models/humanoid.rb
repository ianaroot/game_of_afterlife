require_relative 'humanoidFactory'
require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position

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
      nearest_object.type == :human
    end
  end
end
