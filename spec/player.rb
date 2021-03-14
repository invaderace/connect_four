# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do
  # initializes name and color.

  describe '#make_disc' do
    subject(:red_player) { described_class.new('Player 1', 'red')}

    it 'makes a red disc object' do
      red_disc = red_player.make_disc
      expect(red_disc.color).to be('red')
    end
  end
end
