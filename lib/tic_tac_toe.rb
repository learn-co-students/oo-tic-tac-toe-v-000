class TicTacToe
  def initialize (board = nil)
    @board = Array.new(9, " ") || board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]
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
  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
     @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count % 2 > 0
      return "O"
    else turn_count % 2 == 0
      return "X"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo| @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    if @board.all? {|i| i == "X" || i == "O"}
      return true
    else
      false
    end
  end

  def draw?
    WIN_COMBINATIONS.detect do |combo|
    if won?
      return false
    elsif @board.detect{|b| b == " "}
      return false
    elsif full?
      return true
    else
      true
    end
  end
  end

  def over?
    if draw?
      return true
    elsif full?
      return true
    elsif won?
      return true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
      position_1 = combo[0]
      position_2 = combo[1]
      position_3 = combo[2]

      index = @board[position_1]
      index_2 = @board[position_2]
      index_3 = @board[position_3]
      if index == "X" && index == index_2 && index_2 == index_3
        return "X"
      elsif index == "O" && index == index_2 && index_2 == index_3
        return "O"
      else
        nil
      end
    end
  end

  def play
    until over?
    turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end
end
