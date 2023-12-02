file = File.open('input_2.txt').read
lines = file.split("\n")

RED_COUNT = 12
GREEN_COUNT = 13
BLUE_COUNT = 14

class Game
  def initialize(id:)
    @id = id
    @cube_sets = []
  end

  attr_reader :id
  attr_accessor :cube_sets

  def possible?
    cube_sets.all? do |cube_set|
      cube_set.possible?
    end
  end
end

class CubeSet
  def initialize(red:, green:, blue:)
    @red = red
    @green = green
    @blue = blue
  end

  def possible?
    red <= RED_COUNT && green <= GREEN_COUNT && blue <= BLUE_COUNT
  end

  private

  attr_reader :red, :green, :blue
end

game_instances = []
lines.each do |line|
  game, cube_sets = line.split(':')
  game_id = game.split(' ')[1]
  game_instance = Game.new(id: game_id.to_i)
  game_instances << game_instance
  cube_sets.strip!
  cube_sets.split('; ').each do |cube_set|
    red = 0
    green = 0
    blue = 0
    cube_set.split(', ').each do |color_count|
      count, color = color_count.split(' ')
      case color
      when 'red' then red = count.to_i
      when 'green' then green = count.to_i
      when 'blue' then blue = count.to_i
      end
    end
    game_instance.cube_sets << CubeSet.new(red:, green:, blue:)
  end
end

puts game_instances.select(&:possible?).sum(&:id)
