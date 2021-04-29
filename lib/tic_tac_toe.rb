class TicTacToe

  attr_accessor( :board)

  def initialize(board = nil) # Hook / Callback / Life Cycle Event
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [

  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Middle row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagnol left
  [6,4,2] # Diagnol right
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end


  def input_to_index(input)
    input.to_i - 1
  end


  def move(index, position)
    board[index] = position
  end


  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end


  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end


  def turn_count
    count = 0
    board.each do |b|
    if count <= 9 &&  b == "X" || b == "O"
      count += 1
    end
  end
    count
  end


  def current_player
    turn_count.even? ? board = "X" : board = "O"
  end


  def turn
    puts "Welcome to Tic Tac Toe! Please enter 1-9:"
    input = gets.strip.to_i
    index = input_to_index(input)
    position = current_player

    if valid_move?(index)
      move(index, position) && display_board
    else
      puts "Invalid move, try again!"
      turn
    end
  end


  def won?
    WIN_COMBINATIONS.detect do |w|
    board[w[0]] == board[w[1]] && board[w[2]] == board[w[0]] && position_taken?(w[0])
    end
  end


  def full?
    board.all? do |b|
    b == "X" || b == "O"
    end
  end


  def draw?
    full? && !won?
  end


  def over?
    full? || draw? || won?
  end


  def winner
    if b = won?
      board[b.first]
    end
  end


  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations X!"
      puts "Congratulations O!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
