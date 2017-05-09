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

  def current_player
    turn_count%2 == 0 ? 'X' : 'O'
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def draw?
    if !won? && full?
      return true
    end
    return false
  end

  def full?
     @board.all?{|i| i == 'X' || i == 'O'}
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move( index, current_player='X')
    @board[index] = current_player
  end

  def over?
    if won? || draw?|| full?
      return true
    end
    return false
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    turnsTaken = @board.select do |i|
      i == 'X' || i == 'O'
    end
    return turnsTaken.length
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def winner
    if won?
      combination = won?
      return @board[combination[0]]
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all?{|i| position_taken?(i)} && (combination.all?{|i| @board[i]== 'X'} || combination.all?{|i| @board[i]== 'O'})
        return combination
      end
    end
    return false
  end


end
