class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
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

  def move(location, token="X")
    @board[location.to_i - 1] = token
  end

  def position_taken?(location)
    !(@board[location.to_i] == " " || @board[location.to_i].nil?)
  end

  def valid_move?(input)
     !position_taken?(input.to_i - 1) && (input.to_i - 1).between?(0,8)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
    turn
    end
  end
    # ask for input
    # get input
    # if input is valid
    #   make the move for input
    #   show the board
    # else
    #   ask for input again until you get a valid input
    # end


  # def turn(board)
  #   puts "Please enter 1-9:"
  #   user_input = gets.strip
  #   index = input_to_index(user_input)
  #   if valid_move?(board, index)
  #     character = current_player(board)
  #     move(board, index, character)
  #   else
  #     turn(board)
  #   end
  #   puts display_board(board)
  # end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  # def turn_count(board)
  # counter = 0
  #   board.each do |player|
  #     puts "#{player}"
  #     if player == "X" || player == "O"
  #       counter += 1
  #     end
  #   end
  #   return counter
  # end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  # def current_player(board)
  #   if turn_count(board).even?
  #     return "X"
  #   else
  #     return "O"
  #   end
  # end
  #
  def won?
      WIN_COMBINATIONS.detect do |win_combination|
        (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        end
  end
  # def won?(board)
  #     WIN_COMBINATIONS.detect do |win_combination|
  #       (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
  #       end
  # end
  #
  def full?
    !@board.include?(" ")
  end
  # def full?(board)
  #   !board.include?(" ")
  # end
  #
  def draw?
    !won? && full?
  end
  # def draw?(board)
  #   !won?(board) && full?(board)
  # end
  #
  def over?
    won? || draw?|| full?
  end
  # def over?(board)
  #   won?(board) || draw?(board) || full?(board)
  # end
  #
  def winner
    if !won?
      return nil
    elsif @board[won?[0]] == "X"
      "X"
    elsif @board[won?[0]] == "O"
      "O"
    end
  end

  # def winner(board)
  #   if !won?(board)
  #     return nil
  #   elsif board[won?(board)[0]] == "X"
  #     "X"
  #   elsif board[won?(board)[0]] == "O"
  #     "O"
  #   end
  # end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cats Game!"
    end
  end
   # until the game is over
   #   take turns
   # end
   #
   # if the game was won
   #   congratulate the winner
   # else if the game was a draw
   #   tell the players it has been a draw
   # end

   # def play(board)
   #   while !over?(board) do
   #     turn(board)
   #   end
   #   if won?(board)
   #     puts "Congratulations " + winner(board) + "!"
   #   elsif draw?(board)
   #     puts "Cats Game!"
   #   end
   # end
end
