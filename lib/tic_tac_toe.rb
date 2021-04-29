
class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6]
]


  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(input, player)
    @board[input] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |i|
    unless i == " "
      counter += 1
    end
  end
  counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets
    input = input_to_index(user_input)
    if valid_move?(input)
      move(input, player = current_player)
    else
      turn
    end
    display_board
  end

  def won?
    if @board[WIN_COMBINATIONS[0][0]] == "X" &&
    @board[WIN_COMBINATIONS[0][1]] == "X" &&
    @board[WIN_COMBINATIONS[0][2]] == "X"
    WIN_COMBINATIONS[0]

    elsif @board[WIN_COMBINATIONS[1][0]] == "X" &&
      @board[WIN_COMBINATIONS[1][1]] == "X" &&
      @board[WIN_COMBINATIONS[1][2]] == "X"
      WIN_COMBINATIONS[1]

    elsif @board[WIN_COMBINATIONS[2][0]] == "X" &&
      @board[WIN_COMBINATIONS[2][1]] == "X" &&
      @board[WIN_COMBINATIONS[2][2]] == "X"
     WIN_COMBINATIONS[2]

    elsif @board[WIN_COMBINATIONS[3][0]] == "X" &&
      @board[WIN_COMBINATIONS[3][1]] == "X" &&
      @board[WIN_COMBINATIONS[3][2]] == "X"
     WIN_COMBINATIONS[3]

    elsif @board[WIN_COMBINATIONS[4][0]] == "X" &&
      @board[WIN_COMBINATIONS[4][1]] == "X" &&
      @board[WIN_COMBINATIONS[4][2]] == "X"
     WIN_COMBINATIONS[4]

    elsif @board[WIN_COMBINATIONS[5][0]] == "X" &&
      @board[WIN_COMBINATIONS[5][1]] == "X" &&
      @board[WIN_COMBINATIONS[5][2]] == "X"
     WIN_COMBINATIONS[5]

    elsif @board[WIN_COMBINATIONS[6][0]] == "X" &&
      @board[WIN_COMBINATIONS[6][1]] == "X" &&
      @board[WIN_COMBINATIONS[6][2]] == "X"
     WIN_COMBINATIONS[6]

    elsif @board[WIN_COMBINATIONS[7][0]] == "X" &&
      @board[WIN_COMBINATIONS[7][1]] == "X" &&
      @board[WIN_COMBINATIONS[7][2]] == "X"
     WIN_COMBINATIONS[7]

    elsif @board[WIN_COMBINATIONS[0][0]] == "O" &&
     @board[WIN_COMBINATIONS[0][1]] == "O" &&
     @board[WIN_COMBINATIONS[0][2]] == "O"
     WIN_COMBINATIONS[0]

   elsif @board[WIN_COMBINATIONS[1][0]] == "O" &&
     @board[WIN_COMBINATIONS[1][1]] == "O" &&
     @board[WIN_COMBINATIONS[1][2]] == "O"
     WIN_COMBINATIONS[1]

   elsif @board[WIN_COMBINATIONS[2][0]] == "O" &&
     @board[WIN_COMBINATIONS[2][1]] == "O" &&
     @board[WIN_COMBINATIONS[2][2]] == "O"
    WIN_COMBINATIONS[2]

   elsif @board[WIN_COMBINATIONS[3][0]] == "O" &&
     @board[WIN_COMBINATIONS[3][1]] == "O" &&
     @board[WIN_COMBINATIONS[3][2]] == "O"
    WIN_COMBINATIONS[3]

   elsif @board[WIN_COMBINATIONS[4][0]] == "O" &&
     @board[WIN_COMBINATIONS[4][1]] == "O" &&
     @board[WIN_COMBINATIONS[4][2]] == "O"
    WIN_COMBINATIONS[4]

   elsif @board[WIN_COMBINATIONS[5][0]] == "O" &&
     @board[WIN_COMBINATIONS[5][1]] == "O" &&
     @board[WIN_COMBINATIONS[5][2]] == "O"
    WIN_COMBINATIONS[5]

   elsif @board[WIN_COMBINATIONS[6][0]] == "O" &&
     @board[WIN_COMBINATIONS[6][1]] == "O" &&
     @board[WIN_COMBINATIONS[6][2]] == "O"
    WIN_COMBINATIONS[6]

   elsif @board[WIN_COMBINATIONS[7][0]] == "O" &&
     @board[WIN_COMBINATIONS[7][1]] == "O" &&
     @board[WIN_COMBINATIONS[7][2]] == "O"
    WIN_COMBINATIONS[7]


    end
  end

  def full?
    @board.all? {|i| i != " "}
  end

  def draw?
    won? == nil && full? == true
  end

  def over?
    draw? == true || won? != nil
  end

  def winner
    if @board[WIN_COMBINATIONS[0][0]] == "X" &&
    @board[WIN_COMBINATIONS[0][1]] == "X" &&
    @board[WIN_COMBINATIONS[0][2]] == "X"
    "X"

    elsif @board[WIN_COMBINATIONS[1][0]] == "X" &&
      @board[WIN_COMBINATIONS[1][1]] == "X" &&
      @board[WIN_COMBINATIONS[1][2]] == "X"
      "X"

    elsif @board[WIN_COMBINATIONS[2][0]] == "X" &&
      @board[WIN_COMBINATIONS[2][1]] == "X" &&
      @board[WIN_COMBINATIONS[2][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[3][0]] == "X" &&
      @board[WIN_COMBINATIONS[3][1]] == "X" &&
      @board[WIN_COMBINATIONS[3][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[4][0]] == "X" &&
      @board[WIN_COMBINATIONS[4][1]] == "X" &&
      @board[WIN_COMBINATIONS[4][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[5][0]] == "X" &&
      @board[WIN_COMBINATIONS[5][1]] == "X" &&
      @board[WIN_COMBINATIONS[5][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[6][0]] == "X" &&
      @board[WIN_COMBINATIONS[6][1]] == "X" &&
      @board[WIN_COMBINATIONS[6][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[7][0]] == "X" &&
      @board[WIN_COMBINATIONS[7][1]] == "X" &&
      @board[WIN_COMBINATIONS[7][2]] == "X"
     "X"

    elsif @board[WIN_COMBINATIONS[0][0]] == "O" &&
     @board[WIN_COMBINATIONS[0][1]] == "O" &&
     @board[WIN_COMBINATIONS[0][2]] == "O"
     "O"

   elsif @board[WIN_COMBINATIONS[1][0]] == "O" &&
     @board[WIN_COMBINATIONS[1][1]] == "O" &&
     @board[WIN_COMBINATIONS[1][2]] == "O"
     "O"

   elsif @board[WIN_COMBINATIONS[2][0]] == "O" &&
     @board[WIN_COMBINATIONS[2][1]] == "O" &&
     @board[WIN_COMBINATIONS[2][2]] == "O"
    "O"

   elsif @board[WIN_COMBINATIONS[3][0]] == "O" &&
     @board[WIN_COMBINATIONS[3][1]] == "O" &&
     @board[WIN_COMBINATIONS[3][2]] == "O"
    "O"

   elsif @board[WIN_COMBINATIONS[4][0]] == "O" &&
     @board[WIN_COMBINATIONS[4][1]] == "O" &&
     @board[WIN_COMBINATIONS[4][2]] == "O"
    "O"

   elsif @board[WIN_COMBINATIONS[5][0]] == "O" &&
     @board[WIN_COMBINATIONS[5][1]] == "O" &&
     @board[WIN_COMBINATIONS[5][2]] == "O"
    "O"

   elsif @board[WIN_COMBINATIONS[6][0]] == "O" &&
     @board[WIN_COMBINATIONS[6][1]] == "O" &&
     @board[WIN_COMBINATIONS[6][2]] == "O"
    "O"

   elsif @board[WIN_COMBINATIONS[7][0]] == "O" &&
     @board[WIN_COMBINATIONS[7][1]] == "O" &&
     @board[WIN_COMBINATIONS[7][2]] == "O"
    "O"


    end
  end

  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end
end
