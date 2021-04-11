# frozen_string_literal: true

require 'pry'

require_relative 'board'
require_relative 'player'

#
class Game
  attr_accessor :player1, :player2, :current_player, :board

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'black')
    @player2 = Player.new('Player 2', 'red')
    @current_player = rand_player
  end

  def coinflip
    rand(2)
  end

  def rand_player
    coinflip.zero? ? player1 : player2
  end

  def change_players
    current_player == player1 ? player2 : player1
  end

  def turn
    # prompt the player
    column = current_player.choose_column
    try(column)
    board.grid.each { |x| p x } #########
    # input only the column (x) here. (y) will populate as the last disc dropped.
    win = board.winning?(column)
    # binding.pry
    congratulate(current_player) if win == true
    # update screen
    @current_player = change_players
    turn
  end

  def try(column)
    if board.column_valid?(column)
      board.drop(column, current_player.make_disc)
    else
      # tell not valid
      turn
    end
  end

  def congratulate(player)
    puts "#{player.name} is the winner! Congrats, #{player.name}!"
    exit
  end
end
