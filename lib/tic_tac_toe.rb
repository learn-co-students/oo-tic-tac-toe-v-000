class TicTacToe
  def initialize(board=nil)
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

  def input_to_index(user_input)
    @input = user_input.to_i
    @index = @input-1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    amin = @board[index]
    if amin == " "
      return false
    elsif amin == ""
      return false
    elsif amin == "X" || amin == "O"
      return true
    else amin == nil
      return false
    end
  end

  def valid_move?(index)
    if index >=9 || index < 0
      return false
    elsif index <=9 && index >= 0
      !(position_taken?(index))
    end
  end

  def turn_count
    counter = 0
    @board.each do |n|
      if n != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    @user_input = gets.strip
    @index = input_to_index(@user_input)
    if valid_move?(@index) == true
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|n| @board[n] == "X"}
        return combo
      elsif combo.all?{|n| @board[n] == "O"}
        return combo
      end
    end
    return false
  end

  def full?
    if @board.all?{|n| n != " "}
      return true
    else
      return false
    end
  end

  def draw?
    if full?
      if won? == false
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    if draw?
      return true
    elsif won? != false
      return true
    else
      return false
    end
  end

  def winner
    @x = @board.select{|n| n == "X"}
    @o = @board.select{|n| n == "O"}
    if @x.length > @o.length
      return "X"
    elsif @x.length < @o.length
      return "O"
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X" && won?
      puts "Congratulations X!"
    elsif winner == "O" && won?
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
