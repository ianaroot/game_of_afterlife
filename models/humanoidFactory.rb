class HumanoidBuilder

  def self.populate(humans, zombies)
    population = []
    population.push(self.create_humans(humans)).push(self.create_zombies(zombies))
    population.flatten
  end

  private

  def self.create_humans(number_of_humans)
    humans = []
    number_of_humans.times do #random number
      humans << Humanoid.new({type: :human, speed: 2, position:
                              {x: 5 + rand(791), y: 5 + rand(791)}})
    end
    humans
  end

  def self.create_zombies(number_of_zombies)
    zombies = []
    number_of_zombies.times do #random number
      zombies << Humanoid.new({type: :zombie, speed: 1,position:
                              {x: 5 + rand(791), y: 5 + rand(791)}})
    end
    zombies
  end
end