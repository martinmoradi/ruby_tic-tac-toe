# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'board'
require_relative 'player'

class Player
  attr_accessor :name, :symbol

  def initialize(player_symbol_to_save)
    @symbol = player_symbol_to_save
    @name = ask_player_name
  end

  #on demande le nom
  def ask_player_name
    puts "Rentre le pseudo du joueur #{@symbol} : "
    print '> '
    name = gets.chomp
    name
  end

  #logique par joueur pour récup l'input
  def get_coordinates
    input = nil
    until input.is_a?(Integer) && (1..9).include?(input)
      puts "#{name} (joueur #{symbol}), choisis une case, de 1 à 9 (de gauche à droite et de haut en bas):"
      print '> '
      input = gets.chomp.to_i
    end
    coords = input
  end
end
