require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position, :time_since_infection

  def initialize attributes = {}
    @position = attributes[:position] || {x: (5 + rand(791) ), y: (5 + rand(791) )}
    @speed = attributes[:speed]
    @type = attributes[:type]
    @time_since_infection = 0
    @last_position = @position
  end

  def move_nearest(nearest_object)
    potential_move = attracted_to?(nearest_object) ?
    move_towards(nearest_object.position, speed) :
    move_away_from(nearest_object.position, speed)
     if @last_position == @position
       store_last_position
       move_randomly
     elsif last_simmilar_to_potential?( potential_move )
       store_last_position
       move_perpendicular_to nearest_object.position, speed
     else
       store_last_position
       potential_move
     end
  end

  def last_simmilar_to_potential?( potential_move )
    ((potential_move[:x] - @last_position[:x]).abs < 5) &&
    ((potential_move[:y] - @last_position[:y]).abs < 5)
  end

  def store_last_position
    @last_position = {x: @position[:x], y: @position[:y]}
  end

  def attracted_to? nearest_object
    nearest_object.type == :human
  end

  def bite humanoid
    humanoid.get_bitten if humanoid.type == :human
  end

  def bites?
    type == :zombie
  end

  def get_bitten
    self.type = :infected_human
    self.speed = 0
  end

  def turn_to_zombie
    self.type = :zombie
    self.speed = 5
  end

  def increment_time_since_infection
    self.time_since_infection += 1
    if self.time_since_infection == 5
      self.turn_to_zombie
    end
  end

end
