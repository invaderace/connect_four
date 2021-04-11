# frozen_string_literal: true

require_relative '../lib/player.rb'

describe Player do
  # initializes name and color.

  describe '#make_disc' do
    subject(:red_player) { described_class.new('Player 1', 'red') }

    it 'makes a red disc' do
      red_disc = red_player.make_disc
      expect(red_disc.color).to be('red')
    end
  end

  describe '#choose_column' do
    subject(:chooser) { described_class.new('Player 1', 'red') }

    before do
      valid_input = '1'
      allow(chooser).to receive(:gets).and_return(valid_input)
    end

    it "returns an integer 1 when '1' is entered" do
      output = chooser.choose_column
      expect(output).to eq(1)
    end

    # should add method for checking the gets.chomp input (0-6 only)
  end

  # describe '#drop(array)' do
  #   subject(:dropper) { described_class.new('Player 1', 'red') }
  #
  #   it 'drops (pushes) a disc into an array (column)' do
  #     my_column = Array.new
  #     dropped_on = dropper.drop(my_column)
  #     expect(my_column[0].class).to be(Disc)
  #   end
  # end
end
