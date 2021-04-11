# frozen_string_literal: true

require 'pry'

require_relative '../lib/board.rb'

describe Board do
  describe '#make_bottom_row(array)' do
    subject(:empty_board) { described_class.new }

    it 'makes an array with a length of 7' do
      array = Array.new
      empty_rows = empty_board.make_bottom_row(array)
      expect(empty_rows.length).to be(7)
    end

    it 'fills each index with an empty array' do
      array = Array.new
      empty_rows = empty_board.make_bottom_row(array)
      expect(empty_rows.all? []).to be(true)
    end
  end

  describe '#make_column' do
    subject(:empty_board) { described_class.new }

    it 'makes an empty array' do
      empty_column = empty_board.make_column
      expect(empty_column).to eq([])
    end
  end

  describe '#column_valid?(column)' do
    subject(:valid_test) { described_class.new }

    it 'returns true if the column nothing in it' do
        num = 0
        status = valid_test.column_valid?(num)
        expect(status).to be(true)
    end

    it 'returns true when 5 indexes are used.' do
      5.times { valid_test.grid[0].push('something') }
      num = 0
      status = valid_test.column_valid?(num)
      expect(status).to be(true)
    end

    it 'returns false when 6 indexes are used' do
      6.times { valid_test.grid[0].push('something') }
      num = 0
      status = valid_test.column_valid?(num)
      expect(status).not_to be(true)
    end
  end

  describe '#drop(num, value)' do
    subject(:drop_test) { described_class.new }

    it '#puts the value in the column.' do
      value = 'red disc'
      num = 0
      drop_test.drop(num, value)
      expect(drop_test.grid[0][0]).to eq('red disc')
    end
  end

  describe '#winning?(spot)' do
    # returns true or false if the spot is a winner. finish later.
  end

  describe '#horizontal(x, y)' do
    subject(:horizontal_checker) { described_class.new }

    context 'when 4 go horizontal' do
      it 'returns 4' do
        horizontal_checker.grid = [[nil],['disc'],['disc'],['disc'],['disc'],[nil],[]]
        x = 2
        y = 0
        answer = horizontal_checker.horizontal(x, y)
        expect(answer).to eq(4)
      end
    end
  end

  describe '#vertical(x, y)' do
    # i'm not sure about this one, it only uses check_d so probably rename one.
  end

  describe '#diagon_up(x, y)' do
    subject(:diagup_checker) { described_class.new }

    context 'four go diagonally up' do
      it 'returns 4' do
        diagup_checker.grid = [[],[],[],[nil, nil, 'disc'],[nil, nil, nil, 'disc'],[nil, nil, nil, nil, 'disc'],[nil, nil, nil, nil, nil, 'disc']]
        x = 4
        y = 3
        answer = diagup_checker.diagon_up(x, y)
        expect(answer).to eq(4)
      end
    end
  end

  describe '#diagon_down(x, y)' do
    subject(:diagdown_checker) { described_class.new }

    context 'when four go diagonally down' do
      it 'returns 4' do
        diagdown_checker.grid = [[nil, nil, nil, 'disc'],[nil, nil, 'disc'],[nil, 'disc'],['disc'],[],[],[]]
        x = 0
        y = 3
        answer = diagdown_checker.diagon_down(x, y)
        expect(answer).to eq(4)
      end
    end
  end

  describe '#check_l(x, y)' do
    subject(:left_checker) { described_class.new }

    context 'disc dropped in first column' do
      it 'returns only 1 (because left is nil)' do
        left_checker.grid = [['disc'],[],[],[],[],[],['disc']]
        x = 0
        y = 0
        answer = left_checker.check_l(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs to the left' do
      it 'returns 3' do
        left_checker.grid = [['disc'],['disc'],['disc'],[],[],[],['disc']]
        x = 2
        y = 0
        answer = left_checker.check_l(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_r(x, y)' do
    subject(:right_checker) { described_class.new }

    context 'disc dropped in last column' do
      it 'returns only 1 (because right is nil)' do
        right_checker.grid = [['disc'],[],[],[],[],[],['disc']]
        x = 6
        y = 0
        answer = right_checker.check_r(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs to the right' do
      it 'returns 3' do
        right_checker.grid = [['disc'],['disc'],['disc'],[],[],[],['disc']]
        x = 0
        y = 0
        answer = right_checker.check_r(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_d(x, y)' do
    subject(:down_checker) { described_class.new }

    context 'disc dropped in first row' do
      it 'returns only 1 (because down is nil)' do
        down_checker.grid = [['disc', nil, nil, nil, nil, 'disc'],[],[],[],[],[],[]]
        x = 0
        y = 0
        answer = down_checker.check_d(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs downwards' do
      it 'returns 3' do
        down_checker.grid = [['disc', nil, nil, 'disc', 'disc', 'disc'],[],[],[],[],[],[]]
        x = 0
        y = 5
        answer = down_checker.check_d(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_ld(x, y)' do
    subject(:ld_checker) { described_class.new }

    context 'when the disc is the bottom-left' do
      it 'returns only 1' do
        ld_checker.grid = [['disc'],[],[],[],[],[],[]]
         x = 0
         y = 0
         answer = ld_checker.check_ld(x, y)
         expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs down to the left' do
      it 'returns 3' do
        ld_checker.grid = [['disc'],[nil, 'disc'],[nil, nil, 'disc'],[],[],[],[]]
        x = 2
        y = 2
        answer = ld_checker.check_ld(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_ru(x, y)' do
    subject(:ru_checker) { described_class.new }

    context 'when the disc is in the top right' do
      it 'returns only 1' do
        ru_checker.grid = [[],[],[],[],[],[],[nil, nil, nil, nil, nil, 'disc']]
        x = 6
        y = 5
        answer = ru_checker.check_ru(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs to the top right' do
      it 'returns 3' do
        ru_checker.grid = [[],[],[],[],[nil, nil, nil, 'disc'],[nil, nil, nil, nil, 'disc'],[nil, nil, nil, nil, nil, 'disc']]
        x = 4
        y = 3
        answer = ru_checker.check_ru(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_lu(x, y)' do
    subject(:lu_checker) { described_class.new }

    context 'when the disc is in the top left' do
      it 'returns only 1' do
        lu_checker.grid = [[nil, nil, nil, nil, nil, 'disc'],[],[],[],[],[],[]]
        x = 0
        y = 5
        answer = lu_checker.check_lu(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs to the top left' do
      it 'returns 3' do
        lu_checker.grid = [[nil, nil, nil, nil, nil, 'disc'],[nil, nil, nil, nil, 'disc'],[nil, nil, nil, 'disc'],[],[],[],[]]
        x = 2
        y = 3
        answer = lu_checker.check_lu(x, y)
        expect(answer).to eq(3)
      end
    end
  end

  describe '#check_rd(x, y)' do
    subject(:rd_checker) { described_class.new }

    context 'when the disc is the bottom-right' do
      it 'returns only 1' do
        rd_checker.grid = [[],[],[],[],[],[],['disc']]
        x = 6
        y = 0
        answer = rd_checker.check_rd(x, y)
        expect(answer).to eq(1)
      end
    end

    context 'when there are 2 discs down to the right' do
      it 'returns 3' do
        rd_checker.grid = [[],[],[],[],[nil, nil, 'disc'],[nil, 'disc'],['disc']]
        x = 4
        y = 2
        answer = rd_checker.check_rd(x, y)
        expect(answer).to eq(3)
      end
    end
  end
end
