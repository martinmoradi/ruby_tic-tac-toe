
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board'
require 'game'
require 'display'
require 'player'

class Application

  def perform
    my_game = Game.new

  end

end

Application.new.perform

