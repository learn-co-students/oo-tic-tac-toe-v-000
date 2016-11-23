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
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(board = @board, input, player)
    index = input.to_i - 1
    @board[index] = player
  end

  def position_taken?(position)
    (@board[position] == "X") || (@board[position] == "O")
  end

  def valid_move?(position)
    location = position.to_i - 1
    if location.between?(0,8) &&
       !position_taken?(location)
        true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    unless valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |count|
      if count != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winning = won?
      if winning
        @board.fetch(winning[0])
      else
        nil
    end
  end

  def play
    until over? do
        turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
