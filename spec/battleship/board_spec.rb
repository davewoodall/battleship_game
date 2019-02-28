require 'battleship/board'

RSpec.describe Battleship::Board do
  let(:submarine) do
    {
      id: :s,
      type: :submarine,
      position: 'E7',
      direction: :north,
      length: 3
    }
  end

  describe 'Board' do
    describe 'initialization' do
      it "is created on initialization" do
        result = subject.grid
        expect = Array.new(10) { Array.new(10) }
        expect(result).to eq(expect)
      end

      it 'map column letter to position' do
        result = subject.columns.first
        expect = ["A", 0]
        expect(result).to eq(expect)
      end
    end

    describe 'getters and setters' do
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
    end

    describe 'direction' do
      it 'north goes up' do
        result = subject.point(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end

      it 'south goes down' do
        result = subject.add(submarine)
        subm = subject.get_ship(:submarine)
        subm[:direction] = :south
        result = subject.point(subm)
        expect = ["E7","E8","E9"]
        expect(result).to eq(expect)
      end

      it 'east goes right' do
        result = subject.add(submarine)
        subm = subject.get_ship(:submarine)
        subm[:direction] = :east
        result = subject.point(subm)
        expect = ["E7","F7","G7"]
        expect(result).to eq(expect)
      end

      it 'west goes left' do
        result = subject.add(submarine)
        subm = subject.get_ship(:submarine)
        subm[:direction] = :west
        result = subject.point(subm)
        expect = ["E7","D7","C7"]
        expect(result).to eq(expect)
      end
    end

    describe 'ship awareness' do
      it 'have ships' do
        result = subject.ships
        expect(result).to eq([])
      end
      it 'gets ships from game, passed in'

      it 'get ship coordinates' do
        subject.add(submarine)
        result = subject.coordinates(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end

      it 'place ship on board' do
        subject.add(submarine)
        result = subject.place(submarine)
        expect = ["E7","E6","E5"]
        expect(result).to eq(expect)
      end
    end
  end
end