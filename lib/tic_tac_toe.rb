class TicTacToe
  def initialize(board = nil)
    if (board == nil)
      @board = Array.new(9, " ")
    else
      @board = board
    end
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(input, char)
    index = input_to_index(input)
    @board[index] = char
    #@board = update_array_at_with(position, char)
  end

  def update_array_at_with(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] = "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(input)
    input = input.to_i
    if !position_taken?(input-1) && input.between?(1, 9)
      true
    elsif position_taken?(input-1)
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    #index = input_to_index(input)
    if valid_move?(input) == true
      character = current_player
      move(input, character)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |move|
      if (move == "X" || move == "O")
        count += 1
      end
    end

    return count
  end

  def current_player
    if (turn_count.odd?)
      return "O"
    else
      return "X"
    end
  end

  def won?

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == position_2 && position_2 == position_3  && position_1 != " " && position_2 != " " && position_3 != " ")
        return win_combination
      end
    end

    return false

  end

  def full?
    @board.detect do |index|
      if(index == " ")
        return false
      end
    end

    return true
  end

  def draw?
    if !(won?)
      if (full?)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    if (won? || draw? || full?)
      return true
    else
      return false
    end
  end

  def winner
    if !(won?)
      return nil
    else
      win_combination = won?
      return @board[win_combination[0]]
    end
  end

  def play
    until over?
      turn
    end

    if (won?)
      if (winner == "X")
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    elsif (draw?)
      puts "Cats Game!"
    end

  end

end
