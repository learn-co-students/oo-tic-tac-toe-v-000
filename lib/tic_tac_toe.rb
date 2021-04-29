# describe TicTacToe object class
class TicTacToe
  
  # initialize @board array
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  # describe WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row 
    [3,4,5], # Middle Row 
    [6,7,8], # Bottom Row 
    [0,3,6], # Left Column
    [1,4,7], # Middle Column 
    [2,5,8], # Right Column
    [0,4,8], # Left Diagonal
    [6,4,2]  # Right Diagonal
  ]

  # describe display_board method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # describe input_to_index method
  def input_to_index(user_input)
    if user_input == "1" || user_input == "2" || user_input == "3" || user_input == "4" || user_input == "5" || user_input == "6" || user_input == "7" || user_input == "8" || user_input == "9"
      user_input.to_i - 1
    else
      -1
    end
  end

  # describe move method
  def move(index, token = "X")
    @board[index] = token
  end

  # describe position_taken method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # describe valid_move method
  def valid_move?(index)
    (index >= 0 && index <=8) && !position_taken?(index)
  end

  # describe turn method
  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    index = input_to_index(input)

    token = current_player

    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end

  # describe turn_count method
  def turn_count
    @board.count{|token| token == "X" || token =="O"}
  end

  # describe current_player method
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # describe won? method
  def won?
    WIN_COMBINATIONS.detect {|win_index| win_index if @board[win_index[0]] == @board[win_index[1]] && @board[win_index[1]] == @board[win_index[2]] && @board[win_index[0]] != " "}
  end

  # describe full? method
  def full?
    @board.select{|pos| pos == " "} == []
  end

  # describe draw? method
  def draw?
    won? == nil && full?
  end

  # describe over? method
  def over?
    if won? != nil
      true
    else
      draw?
    end
  end

  # describe winner method
  def winner
    if won? != nil
      win_player = won?
      @board[win_player[0]]
    else
      nil
    end
  end

  # describe play method
  def play
    while over? != true
      turn
    end

    if over? == true && won? != nil
      puts "Congratulations #{winner}!"
    elsif over? == true && draw? == true
      puts "Cat's Game!"
    end
  end
  
end