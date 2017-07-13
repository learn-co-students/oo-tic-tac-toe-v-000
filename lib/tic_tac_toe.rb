class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  board = @board

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def play
    until over?()
      turn()
    end
    if won?()
      if winner() == "X"
      puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    elsif draw?()
      puts "Cat's Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    number = number.to_i
    number - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) == true && position_taken?(index) == false
        true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    number = gets.chomp
    index = input_to_index(number)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count().even? == true
      "X"
    else
      "O"
    end
  end

  def won?
    if !(@board.include?("X")) && !(@board.include?("O"))
      return false
    end
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] != " "
        if @board[combo[0]] != nil && @board[combo[1]] == @board[combo[2]]
           return combo
        end
      end
    end
    false
  end

  def full?
    if @board.include?(" ") || @board.include?(nil)
      false
    else
      true
    end
  end

  def draw?
    if full?() == true && won?() == false
      true
    end
  end

  def over?()
    if won?() || draw?() || full?()
      true
    else
      false
    end
  end

  def winner
    if won?()
      winning_array = won?()
      if @board[winning_array[0]] == "X"
        return "X"
      else
        return "O"
      end
    else
      nil
    end
  end

end
