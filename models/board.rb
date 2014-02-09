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


  def nearest_humanoid(humanoid)
    x = humanoid.position[:x]
    y = humanoid.position[:y]
    other_humanoids = @humanoids - [ humanoid ]
    other_humanoids.min_by do |dude|
      (( x - dude.position[:x] ) ** 2 ) + (( y - dude.position[:y] ) ** 2 )
    end
  end

  def next_turn
    humanoids.each do |humanoid|
      destination = humanoid.move_nearest(nearest_humanoid(humanoid))
      humanoid.position = destination if valid_destination?(destination)
    end
    humanoids
  end
end
