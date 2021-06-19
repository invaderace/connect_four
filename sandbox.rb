require 'pry'
require_relative 'lib/board.rb'

myboard = Board.new
grid = myboard.grid

def str_element(column, row)
  column[row] == nil ? element = ' ' : element = column[row].to_s

  element
end

def make_row(array, row)
  string_row = ''
  array.each do |column|
    string_row == '' ? string_row = '+ ' + str_element(column, row) : string_row = string_row + ' | ' + str_element(column, row)
  end

  string_row + ' +'
end

in_between = "+ - + - + - + - + - + - + - +"

p in_between
current_row = 5
while current_row >= 0
  p make_row(grid, current_row)
  p in_between
  current_row -= 1
end
