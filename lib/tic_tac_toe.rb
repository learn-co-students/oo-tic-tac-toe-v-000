#go back and fix #won? and #winner so they are more eloquent. Do the same for #turn_count.
#check the number of arguments on #move
class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def board=(board)
    @board = board
  end

  def board
    @board
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

  def display_board(board = @board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
#instructions say this one should have two arguments, not three. Check
  def move(board = @board, index, current_player)
    board[index] = current_player
  end

  def position_taken?(board = @board, index)
    board[index] != " " && board[index] != ""
  end

  def valid_move?(board = @board, index)
    !position_taken?(board = @board, index) && index.between?(0, 8)
  end

  def turn_count(board = @board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
      end
    end
      return counter
  end

  def current_player(board = @board)
    if turn_count(board = @board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn(board = @board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board = @board, index)
      #ask why this works with current player//why the three arguments and not two
      move(board = @board, index, current_player = current_player(board = @board))
      display_board(board = @board)
    else
      turn(board = @board)
    end
  end

  def won?(board = @board)
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
   return false
  end

  def full?(board = @board)
    board.none? { |position| position == " " || position == "   "}
  end

  def draw?(board = @board)
    full?(board) && !won?(board)
  end

  def over?(board = @board)
    full?(board) || won?(board) || draw?(board)
  end

  def winner(board = @board)
    won?(board = @board)
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
      end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
      end
    end
    return nil
  end

  def play(board = @board)
    while !over?(board = @board)
      turn(board = @board)
    end
    if won?(board = @board)
      puts "Congratulations #{winner(board = @board)}!"
    end
    if draw?(board = @board)
      puts "Cat's Game!"
    end
  end
end
