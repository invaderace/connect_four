# frozen_string_literal: true

# stores board as an array of arrays, x and y. holds discs as they are dropped.
class Board
  attr_accessor :grid

  def initialize
    @grid = make_bottom_row(Array.new)
  end

  def make_bottom_row(array)
    7.times { array.push(make_column) }
    array
  end

  def make_column
    Array.new
  end

  def column_valid?(column)
    return false if grid[column].length > 5

    return true
  end

  def drop(column, value)
    grid[column].push(value)
  end

  def winning?(x, y = grid[x].length - 1)
    status = false
    status = true if horizontal(x, y) > 3
    status = true if vertical(x, y) > 3
    status = true if diagon_up(x, y) > 3
    status = true if diagon_down(x, y) > 3
    status
  end

  def horizontal(x, y)
    check_l(x, y) + check_r(x, y) - 1
  end

  def vertical(x, y)
    # reduce this? you can only go down.
    check_d(x, y)
  end

  def diagon_up(x, y)
    check_ld(x, y) + check_ru(x, y) - 1
  end

  def diagon_down(x, y)
    check_lu(x, y) + check_rd(x, y) - 1
  end

  def check_l(x, y)
    unless x.zero?
      return 1 + check_l(x-1, y) if @grid[x][y] == @grid[x-1][y]
    end

    1
  end

  def check_r(x, y)
    unless x > 5
      return 1 + check_r(x+1, y) if @grid[x][y] == @grid[x+1][y]
    end

    1
  end

  def check_d(x, y)
    unless y.zero?
      return 1 + check_d(x, y-1) if @grid[x][y] == @grid[x][y-1]
    end

    1
  end

  def check_ld(x, y)
    unless x.zero? || y.zero?
      return 1 + check_ld(x-1, y-1) if @grid[x][y] == @grid[x-1][y-1]
    end

    1
  end

  def check_ru(x, y)
    unless x > 5 || y > 4
      return 1 + check_ru(x+1, y+1) if @grid[x][y] == @grid[x+1][y+1]
    end

    1
  end

  def check_lu(x, y)
    unless x.zero? || y > 4
      return 1 + check_lu(x-1, y+1) if @grid[x][y] == @grid[x-1][y+1]
    end

    1
  end

  def check_rd(x, y)
    unless x > 5 || y.zero?
      return 1 + check_rd(x+1, y-1) if @grid[x][y] == @grid[x+1][y-1]
    end

    1
  end

  # def go(num, value)
  #   column_valid?(num).true? ? column.drop(num, value) : reject
  # end
  #
  # def reject
  #
  # end
end
