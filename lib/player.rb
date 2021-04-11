# frozen_string_literal: true

require_relative 'disc.rb'

# player has name and color. performs various actions on discs.
class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  # use player's color to make new disc object.
  def make_disc
    Disc.new(@color)
  end

  def choose_column
    gets.chomp.to_i
  end

  # # drop coin in array
  # def drop(array)
  #   array.push(make_disc)
  # end
end
