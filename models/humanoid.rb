require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position

  def initialize(attributes = {})
    @position = attributes[:position] || {x: (5 + rand(791)), y: (5 + rand(791))}
    @speed = attributes[:speed]
    @type = attributes[:type]
    @last_position = @position
  end

  def move_nearest(nearest_object)
    potential_move =
    attracted?(nearest_object) ?
    move_towards(position, nearest_object.position, speed) :
    move_away(position, nearest_object.position, speed)
     if @last_position == @position
       store_last_position
       potential_move
     elsif last_simmilar_to_potential?( potential_move )
       store_last_position
       change_direction(potential_move)
       potential_move
     else
       store_last_position
       potential_move
     end
  end

  def last_simmilar_to_potential?( potential_move )
    ((potential_move[:x] - @last_position[:x]).abs < 2) &&
    ((potential_move[:y] - @last_position[:y]).abs < 2)
  end

  def store_last_position
    @last_position = @position
  end

  def change_direction(potential_move)
    temp = potential_move[:y]
    potential_move[:y] = potential_move[:x]
    potential_move[:x] = -temp
    potential_move
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
