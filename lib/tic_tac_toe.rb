class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i-1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    @board[index] == " " && index.between?(0, 8)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    @token = turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    self.input_to_index(input)
    self.current_player
    valid_move?(@index) ? move(@index, @token) : turn
    display_board
  end

  def won?
  @won = WIN_COMBINATIONS.select do |win_combination|
    if @board[win_combination[0]] != " " && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]]
      return win_combination
    end
  end
  return false
  end

  def full?
    @board.none? do |index|
    index == " "
    end
  end

  def draw?
    full? == true && won? == false
  end

  def over?
    won? != false || draw? == true || full? == true
  end

  def winner
    if won? != false
    @board[won?[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end
