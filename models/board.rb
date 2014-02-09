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

  def nearest_humanoid
    #returns nearest humanoid object
  end

  def next_turn(humanoids)
    humanoids.each do |humanoid|
      # nearest = nearest_humanoid
      #testing value
      # nearest = Humanoid.new(type: :zombie, speed: 1, position: {x: 1, y:2})
      destination = humanoid.move_nearest(nearest)
      humanoid.position = destination if valid_destination?(destination)
    end
    humanoids
  end
end


#next_turn tests

# valid_destination? tests
# humanoids = [Humanoid.new(speed: 1, type: :human, position:{x: 0, y: 0}),
#                    Humanoid.new(speed: 1, type: :human, position:{x: 0, y: 1})]
# board = Board.new(humanoids,10,10)

# p board.next_turn(humanoids)

# p board.valid_destination?({x:0, y:0})

