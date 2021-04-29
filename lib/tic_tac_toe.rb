class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

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

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    #user_input = gets.strip
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    index.between?(0,8) && !(position_taken?(index)) ? true : false
  end

  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    if @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
      return win_combo
      end
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"} ? true : false
  end

  def draw?
    !(won?) && full? ? true : false
  end

  def over? 
    won? || draw? ? true : false
  end

  def winner
    if results = won?
      @board[results[0]]
    end
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end

