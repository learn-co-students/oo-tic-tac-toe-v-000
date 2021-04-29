class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row win
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

  def input_to_index(user_input)
    converted_Input = user_input.to_i
    converted_Input - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
   (@board[index] == " " || @board[index] == "" || @board[index] == nil) ? false : true
   end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    #Asking the user for their move by position 1-9.
    puts "Please enter 1-9:"
    #Receiving the user input.
    position = gets.strip
    #Convert position to an index.
    actual_position = input_to_index(position)
    #If the move is valid, make the move and display the board to the user.
    if valid_move?(actual_position)
      token = current_player
      move(actual_position, token)
      display_board
    #If the move is invalid, ask for a new move until a valid move is received.
    else
      turn
    end
  end

  def turn_count
    turns_played = 0
    @board.each do |token|
      if token == "X" || token == "O"
         turns_played += 1
      end
    end
    turns_played
  end

  def current_player
    turn_count.even? ? "X": "O"
    # thing to check ? thing to return if true : thing to return if false
  end

  # Define your play method below


  def won?
    ### ways to check if won?(board) is a falsey value ###
    # won?(board) == nil, !won?(board)
   WIN_COMBINATIONS.detect do |win_combo|
    #check a tic tac toe board and return true if there is a win and false if not.
    #return the winning combination indexes as an array if there is a win.
     w1 = win_combo[0]
     w2 = win_combo[1]
     w3 = win_combo[2]
     # win_combo [0,1,2]
     # all tokens in a line have to be the same

     # condition =
     @board[w1] == @board[w2] && @board[w1] == @board[w3] && @board[w1] != " "

  end #end detect
   #return false
  end #end def

  def full?
    @board.all? {| slot | slot == "X" || slot == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || full? || won?
  end

  def winner
    #board.all? {| slot | slot == "X" && slot == "X" && slot == "X"}
    # if won?(board)
    #   index = won?(board)[0]
    #   board[index]
    # end

    win_combo = won?
    if win_combo
      index = win_combo[0]
      @board[index]
    end

    # win_combo = won?(board)
    # board[win_combo[0]] if win_combo
  end

  def play
    while !over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif  winner == "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
