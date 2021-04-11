# frozen_string_literal: true

require_relative '../lib/game.rb'

describe Game do
  describe '#coinflip' do
    # returns a 0 or 1. no need to test.
  end

  describe '#rand_player' do
    # ternary operator. it just returns one or the other.
  end

  describe '#change_players' do
    # ternary operator. looks at current_player and swaps it for other player.
    subject(:changer) { described_class.new }

    context 'current_player is player1' do
      before do
        changer.current_player = changer.player1
      end

      it 'returns player2' do
        changed = changer.change_players
        expect(changed).to be(changer.player2)
      end
    end
  end

  describe '#turn' do
    # script
  end

  describe '#try(column)' do
    subject(:tryer) { described_class.new }

    context 'column is less than 6 in length (valid)' do
      it 'drops a disc in the column' do
        5.times {tryer.board.grid[0].push('test') }
        tryer.try(0)
        expect(tryer.board.grid[0][5].class).to be(Disc)
      end
    end
  end

  describe '#congrats' do
    # end game, fill this out later.
  end
end
