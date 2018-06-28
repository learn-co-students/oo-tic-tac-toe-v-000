class TicTacToe
  def initialize (board = nil)
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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}  "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input = user_input - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8) && @board[index] == " "
    return true
  else
    return false
  end
  end

  def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
  end

  def turn_count
  counter = 0
  @board.each do |occupied|
  if occupied == "X" || occupied == "O"
    counter += 1
  end
  end
  return counter
  end

  def current_player
  if turn_count%2 == 0
  return "X"
  elsif turn_count%2 == 1
  return "O"
  end
  end

  def won?
    WIN_COMBINATIONS.each do |win_set|
      if win_set.all? {|win_position| @board[win_position] == "X"} || win_set.all? {|win_position| @board[win_position] == "O"}
        return win_set
      elsif @board.all? {|win_position| win_position == " "} || @board.all? {|win_position| win_position == ""}
        false
      end
    end
    false
  end

  def full?
    @board.all?{ |token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end


  def over?
    won?|| draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
