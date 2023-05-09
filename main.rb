# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'logic.rb'
require_relative 'display.rb'

def start_game
  game = Board.new
  game.play_game
end

start_game
