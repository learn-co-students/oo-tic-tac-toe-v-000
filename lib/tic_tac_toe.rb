class TicTacToe
  
  def initialize (board=nil)
    @board = board || Array.new(9, " ")
  end

   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end  

  def input_to_index(input)
    index = input.to_i
    index = index - 1
  end
  
  def move (index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "")
  end
    
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn_count


  end




end





# rspec spec/01_tic_tac_toe_spec.rb