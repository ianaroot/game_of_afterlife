require_relative 'humanoid'
class Board

  attr_reader :width, :height
  attr_accessor :humanoids

  def initialize(humanoids, height, width)
    @humanoids = humanoids
    @height = height
    @width = width
  end

  def valid_destination?(target_position)
    !humanoids.any? do |humanoid|
      humanoid.position == target_position
    end
  end

  def nearest_humanoid(humanoid, type)
    x = humanoid.position[:x]
    y = humanoid.position[:y]
    other_humanoids = @humanoids - [ humanoid ]
    other_humanoids.keep_if { |humanoid| humanoid.type == type }
    other_humanoids.min_by do |dude|
      (( x - dude.position[:x] ) ** 2 ) + (( y - dude.position[:y] ) ** 2 )
    end
  end 

  def next_turn
    humanoids.each do |humanoid|
      if humanoid.type == :infected_human
        humanoid.increment_time_since_infection
        next
      end
      nearest_zombie = nearest_humanoid(humanoid, :zombie)
      nearest_human = nearest_humanoid(humanoid, :human)
      if nearest_human == nil
        destination = humanoid.move_nearest( nearest_zombie )
      elsif humanoid.type == :zombie
        if humanoid.distance_to(nearest_human.position) < humanoid.distance_to(nearest_zombie.position) * 6 
          destination = humanoid.move_nearest(nearest_human)
        else
          destination = humanoid.move_nearest(nearest_zombie)
        end
      elsif humanoid.type == :human
        if humanoid.distance_to(nearest_zombie.position) < 50
          destination = humanoid.move_nearest(nearest_zombie)
        else
          destination = humanoid.move_nearest(nearest_human)
        end
      end
      destination[:y] = destination[:y] % height
      destination[:x] = destination[:x] % width
      if nearest_human != nil
        humanoid.bite nearest_human if humanoid.bites? and humanoid.distance_to(nearest_human.position) < 10
      end
      humanoid.position = destination if valid_destination?(destination)
    end
    humanoids.any? {|humanoid| humanoid.type == :human} ? humanoids : nil
  end
end
