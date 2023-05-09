# frozen_string_literal: false

require './display'
require './logic'

class Board
  attr_accessor :board, :game_is_active, :current_turn, :last_turn

  include Display
  include TicTacToe

  def initialize
    @board = Array.new(3) { Array.new(3, '-') }
    @game_is_active = true

    puts "Which player starts first? 'X' or 'O'"
    starting_turn = gets.chomp.upcase
    @current_turn = starting_turn
    @last_turn = current_turn == 'X' ? 'O' : 'X'

    print_board
    play_game
  end
end
