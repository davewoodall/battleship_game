RSpec.describe BattleshipGame::BattleshipGame do
  fdescribe 'Milestones' do
    subject { BattleshipGame::BattleshipGame.new }

    context 'create a 10 x 10 grid' do
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

    context 'place ships on board'
    context 'implement fire method'
    context 'sinks a ship'
  end
end