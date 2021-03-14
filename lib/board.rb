# frozen_string_literal: true

# stores board as an array of arrays, x and y. holds discs as they are dropped.
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(7, Array.new())
  end
end
