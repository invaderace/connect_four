# frozen_string_literal: true

# a basic class for player pieces. can be black or red.
class Disc
  attr_accessor :color

  def initialize(color)
    @color = color
  end

  def ==(other)
    return false if other.nil?
    
    self.color == other.color
  end
end
