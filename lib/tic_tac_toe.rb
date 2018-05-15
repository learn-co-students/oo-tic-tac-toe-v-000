class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    #WIN_COMBINATIONS?
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
  def display_board
    display_board = @board
  end
  
  def input_to_index(user_input) #DON'T THINK I DID THIS YET
    user_input.to_i - 1 #gets user input, subtracts one to coincide with board array index
  end
  
  def move(board, token = "X")
    @board[index] = token
  end

  def position_taken?(board, index)
    if @board[index] != "" || @board[index] != " "
      true
    end
  end

  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
      true
    end
  end
  
  def turn(board)
    puts "Please enter 1-9"
    user_input = gets.strip
    input_to_index(user_input)
    index = input_to_index(user_input)
    if valid_move?(board, index) == true
      move(board, index, token)
    else
      turn(board)
    end
  end    
    
  def turn_count
    @board.count{| token | token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?(board)
    WIN_COMBINATIONS.detect do | win_combination |
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combintion[0])
    end
  end
  
  def full?(board)
    board.all? {|cell| cell == "X" || cell == "O"}
  end

  def draw?(board)
    if !full?(board) && !won?(board)
      true
  end

  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      true
    else
      false
    end
  end
  
  def winner?(board)
    if won?(board)
      return board[won?(board[0])]
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