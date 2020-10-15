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
    my_game = Game.new
  end
end

Application.new.perform
