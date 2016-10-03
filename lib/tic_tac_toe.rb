class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                    [0,3,6], [1,4,7], [2,5,8],
                    [0,4,8], [2,4,6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    separated = "|"
    separating = "-----------"
    puts " #{@board[0]} #{separated} #{@board[1]} #{separated} #{@board[2]} "
    puts separating
    puts " #{@board[3]} #{separated} #{@board[4]} #{separated} #{@board[5]} "
    puts separating
    puts " #{@board[6]} #{separated} #{@board[7]} #{separated} #{@board[8]} "
  end

  def move(index, character = "X")
    @board[index - 1] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] === "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
        return true
    end
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def valid_move?(input)
    index = input_to_index(input)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input
    #index = input_to_index(input)
    if valid_move?(index)
      move(index.to_ic current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |position| position == "X" || position == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |position| @board[position] == "X" } ||
         combination.all? { |position| @board[position] == "O" }
         return combination
      end
    end
    return nil
  end

  def full?
    if @board.any? { |position| position != "X" && position != "O" }
      return false
    else
      return true
    end
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || draw? || full? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations"
    else
      puts "Game was draw"
    end
  end

end
