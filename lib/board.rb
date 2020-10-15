class Board
attr_accessor :board_cases 

require 'player'
require 'board'

 def initialize 
  @board_cases = ["", "", "", "", "", "", "", "", ""]
   
end


  def full?
    @board_cases.all? { |board_case| board_case == "X" || board_case  == "O" }
  end

end




# WINS_COMBO = [ 
# [0,1,2], # top_row 
# [3,4,5], # middle_row 
# [6,7,8], # bottom_row 
# [0,3,6], # left_column 
# [1,4,7], # center_column 
# [2,5,8], # right_column 
# [0,4,8], # left_diagonal 
# [6,4,2] # right_diagonal 
# ]