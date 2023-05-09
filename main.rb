# frozen_string_literal: true

require_relative 'board'

def start_game
  game = Board.new
  game.play_game
end

start_game
