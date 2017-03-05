class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i)-1
  end

  def move(index,user_token)
    @board[index] = user_token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
  turn = []
  turn = @board.select{|v|v=="X"||v=="O"}
  return turn.length
  end

  def current_player
    player = turn_count
    if player % 2 == 1
      return "O"
    else
      return "X"
    end
  end

  def turn
    puts "Please enter a number 1-9"
    user_input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(index) == true
        user_token = current_player
        move(index,user_token)
        display_board
      else
        puts "invalid move"
        turn
      end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]]=="X"&&@board[combo[1]]=="X"&&@board[combo[2]]=="X"
      return combo
    elsif @board[combo[0]]=="O"&&@board[combo[1]]=="O"&&@board[combo[2]]=="O"
      return combo
    end
  end
    return false
  end

  def full?
    if @board.any?{|i|i==" "}
      return false
    else return true
    end
  end

  def draw?
    if full? == false
      return false
    elsif !!won?
      return false
    else
      return true
    end
  end

  def over?
    # return !!won?(board) || full?(board)
    if !!won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if !!won?
      win_arr = won?
      return @board[win_arr[0]]
    end
  end

  def play
    until over? == true do
      turn
    end
    if !!won?
        puts "Congratulations #{winner}!"
    elsif draw? == true
        puts "Cat's Game!"
    end
  end

end
