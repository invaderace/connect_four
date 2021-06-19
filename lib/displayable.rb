# frozen_string_literal: true

module Displayable
  LINE_WIDTH = 100

  def display_clear
    system 'clear'
    puts
  end

  def display(something)
    something.class == Array ? display_array(something) : (puts something.center(LINE_WIDTH))
    puts
  end

  def display_array(arr)
    arr.each do |line|
      puts line.center(LINE_WIDTH)
    end
  end

  def header
    ['**********************************************',
     '**                                          **',
     '**               Connect Four               **',
     '**                                          **',
     '**********************************************']
  end

  def tell
    { welcome: 'Welcome to connect four.',
      invalid: "Sorry, that's not a valid choice. Please try again." }
  end

  def in_between
    "+ - + - + - + - + - + - + - +"
  end

  def choices
    "  1   2   3   4   5   6   7  "
  end

  def str_element(column, row)
    column[row] == nil ? element = ' ' : element = column[row].color[0]

    element
  end

  def make_row(array, row)
    string_row = ''
    array.each do |column|
      string_row == '' ? string_row = '+ ' + str_element(column, row) : string_row = string_row + ' | ' + str_element(column, row)
    end

    string_row + ' +'
  end

  # assumes array of arrays, arr[][].
  def display_grid(arr)
    puts in_between.center(LINE_WIDTH)
    current_row = 5
    while current_row >= 0
      puts make_row(arr, current_row).center(LINE_WIDTH)
      puts in_between.center(LINE_WIDTH)
      current_row -= 1
    end
  end

  def refresh(grid)
    display_clear
    display(header)
    display_grid(grid)
    display(choices)
  end
end
