class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    #WIN_COMBINATIONS?
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  
  def input_to_index(user_input)
    user_input.to_i - 1 #gets user input, subtracts one to coincide with board array index
  end
 
  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    end
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = gets.strip
    input_to_index(user_input)
    index = input_to_index(user_input)
    if valid_move?(index) == true
      move(@board, index, token)
    else
      puts "That move is invalid."
      turn
    end
  end    
    
  def turn_count
    @board.count{| token | token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do | win_combination |
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
    else
      return false
  end
  
  def full?
    @board.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?
    if !full? && !won?
      true
    else
      false
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end
  
  def winner?(board)
    if won?(board)
      return @board[won?(board[0])]
    end
  end
end

  def play(board)
  turn = 0
  while turn < 9
    turn(board)
    turn += 1
  end
end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      winner(board) == "X" || winner(board) == "O"
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end

end