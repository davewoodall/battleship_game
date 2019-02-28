module Battleship
  class Game

    attr_reader :board, :ships

    def initialize(ships=[], board: Board)
      @board = board.new
      @ships = ships
      place_ships
    end

    def set(position, content)
      board.set(position, content)
    end

    def grid
      @board.grid
    end

    def place_ships
      ships.each { |ship| board.add(ship) }
      board.place_ships
    end

    def fire!(position)
      register(position)
    end

    def get(position)
      board.get(position)
    end

    def register(position)
      if get(position)
        :hit
      else
        :miss
      end
    end
  end
end