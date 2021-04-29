class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

  def input_to_index(string_input)
    int = string_input.to_i
    index = int - 1
    return index
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken? (index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move? (index)
    if index >= 0 && index <= 8
      if !position_taken?(index)
        return true
      end
    else
      return false
    end
  end

  def turn
    value = current_player

    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, value)

      display_board
    else
      puts "invalid"
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |markers|
      if markers == "X" || markers == "O"
        count +=1
      end
    end
    return count
  end

  def current_player
    count = turn_count
    if count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      win_index_0 = win_array[0]
      win_index_1 = win_array[1]
      win_index_2 = win_array[2]

      value_at_win_index_0 = @board[win_index_0]
      value_at_win_index_1 = @board[win_index_1]
      value_at_win_index_2 = @board[win_index_2]

      if value_at_win_index_0 == "X" && value_at_win_index_1 == "X" && value_at_win_index_2 == "X"
        return win_array
      elsif value_at_win_index_0 == "O" && value_at_win_index_1 == "O" && value_at_win_index_2 == "O"
        return win_array
      end
    end
    false
  end

  def full?
    full = true
    @board.each do |position|
      if position != "X" && position != "O"
        full = false
        break
      end
    end
    return full
  end

  def draw?
    if won?
      return false
    else
      if full?
        return true
      else
        return false
      end
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    win_array = won?
    if !win_array
      return nil
    end

    if @board[win_array[0]] == "X"
      return "X"
    elsif @board[win_array[0]] == "O"
      return "O"
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
