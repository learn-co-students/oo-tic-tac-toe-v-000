class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Top left to bottom right diagonal
    [2,4,6]  # Top right to bottom left diagonal
  ]

  def display_board
    row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    line = "-----------"
    puts row1
    puts line
    puts row2
    puts line
    puts row3
  end



  def move(index, token = "X")

    @board[index.to_i - 1] = token
  end

  def position_taken?(index)

    !(@board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !position_taken?(index.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip

    valid_move?(index)
    #if move is valid
    if valid_move?(index)
      move(index, current_player)
    else
        turn
    end
    display_board
  end

  def current_player
     turn_count.even? ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
  index_1 = combo[0]
  token_1 = @board[index_1]
  index_2 = combo[1]
  token_2 = @board[index_2]
  index_3 = combo[2]
  token_3 = @board[index_3]
     if token_1 == "X" && token_2 == "X" && token_3 == "X"
     return combo
     elsif token_1 == "O" && token_2 == "O" && token_3 == "O"
     return combo
     end
    end
    return false
  end

  def full?
    @board.all? do |token|
    token == "X" || token == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if combo = won?
    return @board[combo[0]]
    end
  end

  def play
    until over?
    turn
    end
    if won?
    puts "Congratulations #{winner}!"
  elsif
    draw?
    puts "Cats Game!"
    end
  end


end
