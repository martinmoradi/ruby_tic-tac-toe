class Game
attr_accessor :current_player
require 'player'
require_relative 'board'

  #initialize
  def initialize   
    @view = Display.new
    @board = Board.new    
    Tk.update
    @player_X = Player.new(:X)
    @player_O = Player.new(:O)
    @current_player = coin_flip  
  end 

  def coin_flip  
      puts "Pile ou Face (le joueur X choisit) ?"
      puts "P - Pour Pile !"
      puts "F - Pour Face !"
      cf_input = nil
      until cf_input == "p" || cf_input == "f"
        print "> "
        cf_input = gets.chomp  
        cf_input = cf_input.downcase
      end
     coin_flip_out(cf_input)
  end

  def coin_flip_out(cf_input)    
    flip = ["p, f"].sample
    if flip == "p"
      if cf_input == flip
        puts "Pile ! #{@player_X.name} commence !"
         @current_player = @player_X
      else
         puts "Pile ! #{@player_O.name} commence !"
         @current_player = @player_O
      end
    else
      if cf_input == flip
        puts "Face ! #{@player_X.name} commence !"
        @current_player = @player_X
      else
        puts "Face ! #{@player_O.name} commence !"
        @current_player = @player_O
      end
    end
  end
      
end

Tk.mainloop



  # Boucle !game:  # 
  #   Demander les coordonées & les vérifier & appliquer
  #   Update le board 
  #   Si le jeu est fini ?
  #     Afficher msg victoire ou match nul
  #     Stop la Boucle
  #   Sinon 
  #     Passer à player 2 et continuer à boucler



