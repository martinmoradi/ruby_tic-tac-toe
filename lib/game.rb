# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game
  @@victory = false
  @@draw = false
  attr_accessor :player_X, :current_player, :player_O

  def initialize
    @canvas = Display.new
    Tk.update
    @board = Board.new
    @player_X = Player.new(:X)
    @player_O = Player.new(:O)
    @current_player = coin_flip
  end

  def coin_flip
    puts 'Pile ou Face (le joueur X choisit) ?'
    puts 'P - Pour Pile !'
    puts 'F - Pour Face !'
    cf_input = nil
    until cf_input == 'p' || cf_input == 'f'
      print '> '
      cf_input = gets.chomp
      cf_input = cf_input.downcase
    end
    coin_flip_out(cf_input)
  end

  def coin_flip_out(cf_input)
    flip = ['p, f'].sample
    if flip == 'p'
      if cf_input == flip
        puts "Pile ! #{@player_X.name} commence !"
        @player_X
      else
        puts "Pile ! #{@player_O.name} commence !"
        @player_O
      end
    else
      if cf_input == flip
        puts "Face ! #{@player_X.name} commence !"
        @player_X
      else
        puts "Face ! #{@player_O.name} commence !"
        @player_O
      end
    end
  end

  def play
    until @@victory || @@draw
      coords = @current_player.get_coordinates
      if @board.coordinates_available?(coords)
        @board.move_board(coords, @current_player)
        if @current_player == @player_X
          @canvas.cross(coords)
        else
          @canvas.circle(coords)
        end
        Tk.update
        if @board.has_won?(@current_player)      
         @@victory = true
        elsif @board.is_draw?
          @@draw = true
        end
        switch_players unless @@victory
      else
        puts 'La case est déjà prise !'
      end
    end
    puts "Le gagnant est #{@current_player.name} !!" if @@victory 
    puts "Match nul ..." if @@draw 
  end

  def switch_players
    @current_player = if @current_player == player_X
                        player_O
                      else
                        player_X
                      end
  end
end

go = Game.new
Tk.update
go.play

Tk.mainloop

