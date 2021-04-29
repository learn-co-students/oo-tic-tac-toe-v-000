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

  def input_to_index(input)
      input = input.to_i
      input - 1
  end

  def move(index,token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " or @board[index] == "" or @board[index] == nil
      return false
    elsif @board[index] == "X" or @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)
      if index.between?(0, 8) && !position_taken?(index)
        return true
      else
        return false
      end
  end

  def turn
    puts "Please enter 1-9:"
    number = gets.strip
    number = input_to_index(number)
    token = current_player
    if valid_move?(number)
      move(number,token)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    number = turn_count
    number.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
  end

  def full?
      !@board.include?(" ")
  end

  def draw?
      if !won? && full?
        return true
      else
        return false
      end
  end


  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      character = won?
      return @board[character[0]]
    end
  end

  def play
    turn_counter = 0
    while turn_counter < 9 && !over?
      turn
      turn_counter += 1
    end
    winning_token = winner
    if won?
      puts "Congratulations #{winning_token}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
