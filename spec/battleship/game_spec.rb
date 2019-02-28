require 'battleship/game'

RSpec.describe Battleship::Game do
  let(:carrier) do
    {
      type: :carrier,
      position: 'A6',
      direction: :south,
      length: 5
    }
  end

  let(:battleship) do
    {
      type: :battleship,
      position: 'D9',
      direction: :east,
      length: 4
    }
  end

  let(:submarine) do
    {
      type: :submarine,
      position: 'I7',
      direction: :north,
      length: 3
    }
  end

  subject(:game) { Battleship::Game.new([carrier, battleship, submarine]) }

  context 'hits' do
    it 'strikes the beginning edge' do
      turn = subject.fire!('I7') # Hits the Submarine
      expect(turn).to eql :hit
    end

    it 'strikes the middle' do
      turn = subject.fire!('E9') # Hits the Battleship
      expect(turn).to eql :hit
    end

    it 'strikes the ending edge' do
      turn = subject.fire!('A10') # Hits the Carrier
      expect(turn).to eql :hit
    end
  end

  context 'misses' do
    it 'does not strike the middle of the ocean' do
      turn = subject.fire!('E6')
      expect(turn).to eql :miss
    end
  end

  context 'sinking' do
    xit 'sinks a ship' do
      expect(subject.fire!('A6')).to eql :hit
      expect(subject.fire!('A7')).to eql :hit
      expect(subject.fire!('A8')).to eql :hit
      expect(subject.fire!('A9')).to eql :hit
      expect(subject.fire!('A9')).to eql :already_hit

      turn = subject.fire!('A10')
      expect(turn).to eql :sunk
      expect(subject.fire!('G9')).to eql :hit
    end
  end

    context "Dave's temporary tests" do
      it 'initializes with a board' do
        result = subject.grid[0].length
        expect = 10
        expect(result).to eq(expect)
      end

      it 'get grid position' do
        subject.grid[0][0] = 'boom'
        result = subject.get('A1')
        expect = 'boom'
        expect(result).to eq(expect)
      end

      it 'set grid with content' do
        subject.set('A1', 'pow')
        result = subject.get('A1')
        expect = 'pow'
        expect(result).to eq(expect)
      end

      it 'get contents of position' do
        pos = subject.get('I7')
        expect(pos).to eq('s')
      end

      it 'there is a register of those ships' do
        position = 'I7'
        subject.get(position)
        result = subject.register(position)
        expect = :hit
        expect(result).to eq(expect)
      end

      it 'record results'
      it 'validates grid boundaries'
      it 'validates grid overlap'
    end
end
