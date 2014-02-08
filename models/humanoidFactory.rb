module HumanoidBuilder
  extend self #class << self
  def populate(humans, zombies)
    create(humans, :human, 2) + create(zombies, :zombie, 1)
  end

  private

  def create(number, type, speed)
    population = []
    number.times do
      population << Humanoid.new(type: type, speed: speed, position:
                              {x: 5 + rand(791), y: 5 + rand(791)})
    end
    population
  end
end