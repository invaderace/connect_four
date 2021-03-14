# frozen_string_literal: true

#
class Player
  attr_accessor :name, color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
