class TicTacToe

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

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !(position_taken?(index))
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if index.between?(0,8)
      valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    turns = 0
    @board.each do |element|
      if element != " "
      turns += 1
      end
    end
    return turns
  end

  def current_player
    turns = turn_count
    turns % 2 == 0 ? current_player = "X" : current_player = "O"
    return current_player
  end

  def won?
    WIN_COMBINATIONS.detect {|array|
      @board[array[0]] == @board[array[1]] &&
      @board[array[1]] == @board[array[2]] &&
      position_taken?(array[0])}
  end

  def full?
    if @board.detect {|i| i == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      if @board[won?[0]] == "X"
        return "X"
      elsif @board[won?[0]] == "O"
        return "O"
      else
        return nil
      end
    else
      return nil
    end
  end

  def play
    counter = 0
    while counter.between?(0,8) && !over?
      turn
      counter += 1
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end
