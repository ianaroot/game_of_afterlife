class Humanoid
  attr_accessor :type, :speed, :position

  def initialize(attributes = {})
    @position = attributes[:position] || {x: 0, y: 0}
    @speed = attributes[:speed] || 1
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

human = Humanoid.new({type: :human})
human2 = Humanoid.new({type: :human})

zombie = Humanoid.new({type: :zombie})
zombie2 = Humanoid.new({type: :zombie})

# class for testing; replace with PF module
#   def self.move_away(position, target_position, speed)
#     "youre moving away from dat object bro"
#   end

#   def self.move_towards(position, target_position, speed)
#     "youre moving towards that guy"
#   end
# end

# p human.move_nearest(zombie) == "youre moving away from dat object bro"
# p zombie.move_nearest(human2) == "youre moving towards that guy"

# p human.attracted?(zombie) == false
# p human.attracted?(human2) == true
# p zombie.attracted?(zombie2) == false
# p zombie.attracted?(human) == true