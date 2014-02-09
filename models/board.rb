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
    p target_position
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

  def next_turn(humanoids)
    humanoids.each do |humanoid|
      destination = humanoid.move_nearest(nearest_humanoid(humanoid))
      humanoid.position = destination if valid_destination?(destination)
    end
    humanoids
  end
end



# next_turn tests

# valid_destination? tests
# humanoids = [ Humanoid.new(speed: 1, type: :human, position:{x: 0, y: 0}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 0, y: 1}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 4, y: 1}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 4, y: 3}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 2, y: 1}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 1, y: 2}),
#               Humanoid.new(speed: 1, type: :human, position:{x: 0, y: 8}),
#            ]
# board = Board.new(humanoids,10,10)

# p board.next_turn(humanoids)

# p board.valid_destination?({x:0, y:0})
# p board.nearest_humanoid(humanoids[2])
