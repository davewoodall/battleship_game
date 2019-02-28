require "battleship/version"

module Battleship
  class Error < StandardError; end
  require 'battleship/game'
  require 'battleship/board'
  require 'battleship/state'
end
