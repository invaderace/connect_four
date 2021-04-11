# frozen_string_literal: true

module Displayable
  LINE_WIDTH = 80

  def display_clear
    system 'clear'
    puts
  end

  def display(something)
    something.class == Array ? display_array(something) : (puts something.center(LINE_WIDTH))
    puts
  end

  def display_array(something)
    something.each do |line|
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
end
