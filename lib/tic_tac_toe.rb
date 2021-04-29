class TicTacToe
  
 
    def initialize(board = Array.new(9, " ") ) 
      @board = board
    end
    
    def display_board(board = @board)
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
 
    WIN_COMBINATIONS = [
     [0, 1, 2],
     [3, 4, 5],
     [6, 7, 8],
     [0, 3, 6],
     [1, 4, 7],
     [2, 5, 8],
     [0, 4, 8],
     [2, 4, 6]   
    ]
    
  
  def input_to_index(input)
   input.to_i - 1
  end


  def move(index, token)
    @board[index] = token
  end


  def position_taken?(board = @board, index)
  !(board[index].nil? || board[index] == " ")
  end

 def valid_move?(index, board = @board)
    index.between?(0, 8) && !position_taken?(board, index)
  end
  
  def turn_count
  @board.count {|position| position != " "}
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

  def turn
    puts "Please enter 1-9"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index, board = @board)
       move(index, current_player)
   display_board
  else
   puts "Try again."
   turn
  end
  end
  
  
    def won?
   WIN_COMBINATIONS.detect do |win_index|

   position_1 = @board [win_index[0]]
   position_2 = @board [win_index[1]]
   position_3 = @board [win_index[2]]
   
   
   position_1 == "X" && position_2 == "X" && position_3 == "X" ||
   position_1 == "O" && position_2 == "O" && position_3 == "O"
   
   end
  end
  
  def full?
    @board.all? do|space|
    space == "X" || space == "O"
  end
  end
  
  def draw?
   !won? && full?
  end

  def over?
    draw? || won?
  end
  
  def winner
      won? && @board[won?[0]]
  end
  
  def play 
    until over? 
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end