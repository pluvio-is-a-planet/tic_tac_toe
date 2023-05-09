# frozen_string_literal: false

require_relative 'display'

# Class representing a Tic-Tac-Toe board
class Board
  attr_accessor :board, :game_is_active, :current_turn, :last_turn

  include Display

  def initialize
    @board = Array.new(3) { Array.new(3, '-') }
    @game_is_active = true

    set_starting_turn
    print_board
  end

  private

  def set_starting_turn
    starting_turn = ''
    until %w[X O].include? starting_turn
      puts "Which player starts first? 'X' or 'O'>>"
      starting_turn = gets.chomp[0].upcase
    end
    @current_turn = starting_turn
    @last_turn = current_turn == 'X' ? 'O' : 'X'
  end
end
