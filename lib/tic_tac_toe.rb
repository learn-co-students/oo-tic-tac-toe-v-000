class TicTacToe

  def initialize(board=nil)
    @board = Array.new(9, " ")
  end

  # WIN_COMBINATIONS constant defines all possible location combinations that win a game
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
  ]

  # display_board returns a graphical representation of the active board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # move accepts user input of position to play on the board, and player token (X or O; default is X)
  def move(position,token="X")
    position=position.to_i - 1
    @board[position]=token
  end

  # position_taken? checks that player's desired location is empty/available to be played.  If the position is free, method returns false
  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end

  # valid_move? returns true if move is on the board and not already occupied
  def valid_move?(position)
    index=position.to_i - 1
    index.between?(0, 8) && !(position_taken?(index))
  end

  # turn defines the logic of a single turn of tic-tac-toe-rb
  def turn
    #asks for user input, converts input to integer
    puts "Enter the position you like to play (1-9): "
    user_input = gets.strip

    #if move is valid, accepts move as index and displays new board
    if valid_move?(user_input)
      token=current_player
      move(user_input, token)
      display_board
    else
      turn
    end
  end

  # turn_count keeps track of the number of turns
  def turn_count
    @board.count{|value| (value=="X" || value=="O")}
    #counter = 0
    #@board.each do |value|
    #  if value =="X" || value == "O"
    #    counter+=1
    #  end
    #end
    #counter
  end

  # current_player keeps track of whether current move is X or O
  def current_player
    turn_count%2==0 ? "X" : "O"
  end

  # won? returns winning combination of tokens, if present
  def won?
     WIN_COMBINATIONS.any? do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_taken?(win_index_1) && position_1 == position_2 && position_2 == position_3
        #binding.pry
        return win_combo
      end
    end
  end

  # full? monitors board status, returns false if there is an available space to play
  def full?
    @board.all? {|value| value == "X" || value =="O"}
  end

  # draw monitors board status, returns true if board is full and the game can't be won
  def draw?
    !(won?) && full?
  end

  # over?monitors game status, based on whether game is won or a draw
  def over?
    won? || draw?
  end

  # winner(board) returns the winning token, X or O, of a winning game
  def winner
    if winning_array = won?
      @board[winning_array[0]]
    end
  end

  # play is responsible for the game loop: it asks players to play until the game is won or is a draw.  If the game has a winner, #play congratulates the winner
  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
