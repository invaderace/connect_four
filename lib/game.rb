# frozen_string_literal: true

#
class Game
  attr_accessor

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'black')
    @player2 = Player.new('Player 2', 'red')
  end
end
