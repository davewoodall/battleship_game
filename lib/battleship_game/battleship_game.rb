module BattleshipGame
  class BattleshipGame

    attr_reader :grid, :columns

    def initialize
      @grid = create_grid
      @columns = make_columns
    end

    def fire!(position)
    end

# private

    def get(pos)
      row = get_row pos[1]
      col = get_column pos[0]
      row[col]
    end

    def set(pos, item)
      row = get_row pos[1]
      col = get_column pos[0]
      row[col] = item
    end

    def get_column(col)
      @columns.find { |c| c[0] === col }[1]
    end

    def make_columns
      ('A'..'J').map.with_index do |let, i|
        [let, i]
      end
    end

    def get_row(row)
      r = row.to_i - 1
      grid[r]
    end

    def create_grid
      Array.new(10) do
        Array.new(10)
      end
    end
  end
end