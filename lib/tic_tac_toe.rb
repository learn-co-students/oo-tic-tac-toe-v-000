class TicTacToe
  
  def initialize
  @board = Array.new(9," ")
  end
  
  WIN_COMBINATIONS=
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    int_input = number.to_i
    int_input = int_input - 1
  end
  
  def move(index,char="X")
  @board[index] = char
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index) ? true : false
  end
  
  def turn_count
    @board.count{|i| i == "X" || i == "O"}
  end
    
  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    index_1 = gets.strip
    index_2 = input_to_index(index_1)
    if valid_move?(index_2)
      move(index_2,current_player)
      display_board
    else
      turn
    end
  
  end
  
  
  def won?
  WIN_COMBINATIONS.each do |wc_oa|     
    #win comb outer array wc_oa
   w_x = wc_oa.all?{|i| @board[i] =="X"}
   w_o = wc_oa.all?{|i| @board[i] =="O"}
     if w_x == true || w_o == true
       return wc_oa
     end
  end
  return false
  end
  
  def full?
    @board.all?{|i| i=="X"||i=="O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    if won?
      arr_1 = won?
      w = arr_1[0]
      return @board[w]
    end
  end
  
  def play
    
    while !over?
      turn
    end
    
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{winner}!"
      end
      
  end
  
  
end

