require_relative 'humanoidFactory'
require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position

  def initialize(attributes = {})
    @position = attributes[:position]
    @speed = attributes[:speed]
    @type = attributes[:type]
  end

  def move_nearest(nearest_object)
    attracted?(nearest_object) ?
     Pathfinder.move_towards(position, nearest_object.position, speed) :
     Pathfinder.move_away(position, nearest_object.position, speed)
  end

  def attracted?(nearest_object)
    case type
    when :human
      nearest_object.type == :zombie ? false : true
    when :zombie
      nearest_object.type == :human
    end
  end
end


 pop = HumanoidBuilder.populate(3,5)

p human = pop.first
p zombie = pop.last
p human.move_nearest(zombie)
p zombie.move_nearest(human)
