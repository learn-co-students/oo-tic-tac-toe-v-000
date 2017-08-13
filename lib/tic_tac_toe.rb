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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def valid_move?(index)
    if position_taken?(index)
    return false
  elsif index.between?(0,8)
      return true
    else
      return false
    end
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else return true
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end



  def move(user_input, value)
    @board[user_input] = value
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
       move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
        puts "#{counter}"
      end
    end
    counter
  end


  def current_player
    if turn_count.even?
      return "X"
    elsif  turn_count.odd?
      return "O"
    else
      return "O"
    end
  end


  def won?
   WIN_COMBINATIONS.detect do |win|
     @board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]] && position_taken?(win[1])
   end
  end

  def full?
   full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
   if full_board == @board
     return true
   else
     return false
  end
  end

  def draw?
    draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    won?
    full?
    if @board == draw_board
      return true
    elsif won? == @board
      return false
    else return false
  end
  end

  def over?
    draw? || won?

  end

  def winner
    if win = won?
      return @board[win[0]]

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
  else
    puts "Cat's Game!"
   end
  end

end
