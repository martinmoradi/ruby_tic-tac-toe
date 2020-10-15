require 'bundler'
Bundler.require

require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game

  @@victory = false

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
  
  until @@victory
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
         "puts #{@current_player.name} a gagné ! :)"
          @@victory = true
       end
      switch_players unless @@victory
    else 
      puts "La case est déjà prise !"
    end
  end
end    

 

  def switch_players
    if @current_player == player_X
      @current_player = player_O
    else
      @current_player = player_X
    end
  end
 

end


go = Game.new
Tk.update
go.play

Tk.mainloop
























# def Play

  # Boucle !game_over:  # 
  #   Demander les coordonées & les vérifier & appliquer
  #   Update le board 
  #   Si le jeu est fini ?
  #     Afficher msg victoire ou match nul
  #     Stop la Boucle
  #   Sinon 
  #     Passer à player 2 et continuer à boucler







  # def input_to_index 
  #   #prend l'input du joueur - 1 
  # end

  # def player_move(input_to_index)
  #   #interagit avec la case
  # end

  # def is_valid? 
  #   #vérifier si le move est valide -> case deja prise ?
  # end

  # def is_still_going?
  #   #vérifier si conditions de victoire == true
  #   #ou si board full == tie
  # end

  # def player_turn
  #   #a qui le tour ?
  # end
