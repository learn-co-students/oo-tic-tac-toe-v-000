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
    @board[index]=token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "")
  end
    
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn_count
    counter = 0
    @board.each do |count|
      if count == "O" || count == "X"
      counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
   elsif turn_count % 2 != 0
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input=gets.chomp
    index = input_to_index(input)
   
    if valid_move?(index)
      move(index, token=current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
      if position_taken?(win_index_1) && position_2 == position_1 && position_3 == position_2
         return win_combination
      end     
    end
    return false
  end

  def full?
    @board.all? do |board_array|
      @board_array == "X" || @board_array == "O"
    end
  end

end





# rspec spec/01_tic_tac_toe_spec.rb