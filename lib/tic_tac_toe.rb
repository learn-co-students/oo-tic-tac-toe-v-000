class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  #Top row
    [3,4,5],  #Middle row
    [6,7,8],  #Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Second column
    [2,5,8],  #Third column
    [0,4,8],  #First diagonal
    [2,4,6],  #Second diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #Play method that starts and finishes the game
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  #Checks to see if the game is over
  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0])
    end
  end

  #Checks to see if the game is a draw
  def draw?
    !won? && full?
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all? do |char|
      char == "X" || char == "O"
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, token)
    @board[location.to_i-1] = token
  end

  #Checks to see who is the winner
  def winner
    if combination = won?
      @board[combination.first]
    end
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
end
