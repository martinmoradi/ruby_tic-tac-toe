# frozen_string_literal: true

class Board
  attr_accessor :board_cases

  def initialize
    # crée un array vide pour la logique des cases
    @board_cases = ['', '', '', '', '', '', '', '', '']
    @@win_combos = [
      [0, 1, 2], # top_row
      [3, 4, 5], # middle_row
      [6, 7, 8], # bottom_row
      [0, 3, 6], # left_column
      [1, 4, 7], # center_column
      [2, 5, 8], # right_column
      [0, 4, 8], # left_diagonal
      [6, 4, 2] # right_diagonal
    ]
  end

  # applique le symbole du current player à l'index de l'array via index
  def move_board(coords, symb = @current_player.symbol)
    @board_cases[coords - 1] = symb
  end

  # check si la case n'est pas deja prise
  def coordinates_available?(coords)
    @board_cases[coords - 1] == ''
  end

  # match nul ?
  def is_draw?
    @board_cases.none? { |board_case| board_case == '' }
  end

  # partie gagné?
  def has_won?(symb = @current_player.symbol)
    @@win_combos.any? { |combo| combo.all? { |i| board_cases[i] == symb } }
  end
end
