class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6],
    [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] === "O" || @board[index] === "X"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|e| e === "O" || e === "X"}
  end

  def current_player
    # turn_count % 2 === 0 ? "X" : "O"
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number between 1 and 9:"
    input = gets.strip
    index = input_to_index(input)
    # valid_move?(index) ? move(index, current_player) : turn
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |e|
      @board[e[0]] === @board[e[1]] &&
      @board[e[1]] === @board[e[2]] &&
      !(@board[e[0]] === "" || @board[e[0]] === " ")
    end
  end

  def full?
    # turn_count == 9 ? true : false
    @board.all? {|e| e != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning = won?
      @board[winning[0]]
    end
  end

  def play
    # while !over?
    #   turn
    # end
    # if over? && won?
    #   puts "Congratulations #{winner}!"
    # elsif over? && draw?
    #   puts "Cat's Game!"
    # end
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
