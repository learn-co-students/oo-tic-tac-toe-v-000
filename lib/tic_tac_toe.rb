class TicTacToe
  #This method initializes the empty board.
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #This constant contains all of the possible winning
  #combinations of the game.
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  #This method prints out the current state of the board.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #This method places the users token into the specified spot.
  def move(location, token = "X")
    @board[location - 1] = token
  end

  #This method determines whether or not the position that the
  #player picked already has a token in it.
  def position_taken?(location)
    if @board[location] != "X" && @board[location] != "O"
      false
    else
      true
    end
  end

  #Checks if the location is on the board and if it is taken.
  def valid_move?(location)
    if (location.to_i - 1).between?(0,8) && !position_taken?(location.to_i - 1)
      true
    else
      false
    end
  end

  #Plays a turn of the game: It asks the user where to place
  #their token, and it moves it there.
  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    if valid_move?(input)
      move(input.to_i, current_player)
    else
      turn
    end
    display_board
  end

  #Keeps track of how many turns have occured and therefore,
  #how many tokens are on the board.
  def turn_count
    count = 0
    @board.each do |number|
      if number == "X" || number == "O"
        count += 1
      end
    end
    count
  end

  #Determines the current player - X or O.
  def current_player
    if turn_count.even?
      player = "X"
    else
      player = "O"
    end
    player
  end

  #This method tells whether or not someone has won the game.
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  #Checks to see if the board is full.
  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end

  #If the board is full, but no one has won, then the game
  #must be tied.
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  #If there is a draw or someone has won, the game is over.
  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  #Determines the winner of the game.
  def winner
    if won?
      win = won?
      return @board[win[0]]
    end
  end

  #Plays the game. Runs through the turns, determines if someone
  #won or if it was a tie, and congnratulates the winner.
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end