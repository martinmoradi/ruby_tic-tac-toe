class Player
  attr_accessor :name, :symbol
  require 'board'
  require 'game'
  
  def initialize(player_symbol_to_save)
    @symbol = player_symbol_to_save
    @name = ask_player_name    
  end
  
  def ask_player_name
    puts "Rentre le pseudo du joueur #{@symbol} : "
    print "> "
    name = gets.chomp
  end

  def get_coordinates
    loop do         
    puts "#{@current_player.name}(joueur #{@current_player.symbol}), choisis une case, de 1 à 9 (de gauche à droite et de haut en bas):"
    print "> "
    coords = gets.chomp.to_i
    
    if is_valid_format?(coords) 
       coords_case_idx = coords - 1
      if is_location_available?(coords_case_idx)
        @board_cases[coords_case_idx] = @symbol
        break
      else puts "La case est déjà prise !"
      end
    else puts "Le format de ton input n'est pas valide !"
    end
  end
  end

   def is_valid_format?(coords)
    coords.is_a(Integer) && (1..9).include?(coords)
   end

   def is_location_available?(coords_case_idx)
    @board_cases[coords_case_idx] == ""
   end

end