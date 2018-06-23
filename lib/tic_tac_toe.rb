class TicTacToe
  
  def initialize()
     @board = Array.new(9, " ")
   end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8], 
  [6, 4, 2],
  [1, 4, 7],
  [0, 3, 6],
  [2, 5, 8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    separator = "-----------"
    puts separator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1 
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if
    @board[index] == " " || @board[index] == "" || @board[index] == nil
      false 
    else
      true
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index) 
      true
    else 
      false 
    end
    end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, token="X")
      display_board
    else
        turn
      end
    end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    return counter
  end
  
end
 