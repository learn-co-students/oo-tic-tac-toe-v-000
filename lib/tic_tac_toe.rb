class TicTacToe
  def initialize(board = nil)
      @board = Array.new(9, " ")
  end

  attr_accessor :board
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

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(input, token = "X")
    @board[input.to_i-1] = token
  end

  def position_taken?(index)
    if board[index] == "X" || board[index] == "O"
      return true
    elsif board[index] == " " || board[index] == "" || board[index] == nil
      return false
    else
      return false
    end
  end

  def valid_move?(index)
    if index.to_i.between?(1, 9) && !position_taken?(index.to_i-1)
      true
    else
      false || nil
    end
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
  #until ask for a new position until a valid move is received
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

  #current_player
  def current_player
    if turn_count % 2 == 0
       "X"
    else
       "O"
    end
  end

  #won?
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] &&
      board[win_combination[1]] == board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  #full?
  def full?
    board.all?{|token| token == "X" || token == "O"}
  end

  #draw?
  def draw?
    #true if the board has not been won and is full
    !won? && full?
    #false if the board is not won and board is not full
    #false if the board is won
  end

  #over?
  def over?
    won? || draw?
  end

  #WINNER
  def winner
    if win_combination = won?
    board[win_combination.first]
    end
  end

end
