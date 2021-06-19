# frozen_string_literal: true

require 'pry'

require_relative 'board'
require_relative 'player'
require_relative 'displayable'

#
class Game
  include Displayable
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

  def setup
    refresh(board.grid)
  end

  def turn
    whoops if board_full?
    prompt(@current_player)
    column = current_player.choose_column - 1
    try(column)
    refresh(board.grid)
    win = board.winning?(column)
    congratulate(current_player) if win == true
    @current_player = change_players
    turn
  end

  def prompt(player)
    puts "#{player.name}, where will you go?".center(LINE_WIDTH)
  end

  def try(column)
    if board.column_valid?(column)
      board.drop(column, current_player.make_disc)
    else
      refresh(board.grid)
      display(tell[:invalid])
      turn
    end
  end

  def congratulate(player)
    puts "#{player.name} is the winner! Congrats, #{player.name}!".center(LINE_WIDTH)
    exit
  end

  def board_full?
    full = board.grid.all? do |column|
      column.length == 6
    end

    full
  end

  def whoops
    display("Whoops, the board is full!")
    exit
  end
end
