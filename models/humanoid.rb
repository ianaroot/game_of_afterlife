require_relative 'pathfinder'

class Humanoid
  include Pathfinder
  attr_accessor :type, :speed, :position, :time_since_infection

  def initialize attributes = {}
    @position = attributes[:position] || {x: (5 + rand(791) ), y: (5 + rand(791) )}
    @speed = attributes[:speed]
    @type = attributes[:type]
    @time_since_infection = 0
  end

  def move_nearest nearest_object
    important_point = nearest_object.position
    attracted_to?(nearest_object) ? move_towards(important_point, speed) : move_away_from(important_point, speed)
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
