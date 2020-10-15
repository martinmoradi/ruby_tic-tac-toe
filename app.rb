# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'board'
require 'game'
require 'display'
require 'player'

class Application
  def perform
    keep_playing = true
    while keep_playing
      my_game = Game.new
      Tk.update
      my_game.play
      keep_playing = continue?
    end
  end

  # méthode pour loop (mais ça bug de toutes facons :D)
  def continue?
    input = nil
    unless input == 'y' || 'n'
      puts 'Voulez-vous continuer ? Y/N'
      print '> '
      input = gets.chomp
      if input.downcase == 'y'
        true
      elsif input.downcase == 'n'
        false
      end
    end
  end
end

Application.new.perform
Tk.update
Tk.mainloop
