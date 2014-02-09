class Board

  attr_reader :width, :height
  attr_accessor :humanoids

  def initialize(humanoids, height, width)
    @humanoids = humanoids
    @height = height
    @width = width
  end

  def valid_destination?(position)

  end

  def nearest_humanoid(humanoid)
    #returns nearest humanoid object
  end

  def next_turn
    #returns array of humanoids
  end
end