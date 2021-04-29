class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    if (@board[index].nil? || @board[index] == " ")
      false
    elsif (@board[index] == "X" || @board[index] == "O")
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0, 8) && !position_taken?(index))
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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

  def won?
  WIN_COMBINATIONS.each do |win_combination|

    if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
      return win_combination
    elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      return win_combination
    end
  end
  return false
end

  def full?
    if @board.include?(" ") || @board.include?("")
      false
    else
      true
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |win_combination|

      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return "X"
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return "O"
      end
    end
    return nil
  end

  def play
    num_of_turns = 0
    until over? == true || won? != false
      turn
      num_of_turns += 1
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cat's Game!"
    else
      return nil
    end
  end
end
