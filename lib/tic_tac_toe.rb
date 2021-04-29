class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],  # top row
    [3,4,5],  # middle row
    [6,7,8],  # bottom row
    [0,3,6],  # left column
    [1,4,7],  # middle column
    [2,5,8],  # right column
    [0,4,8],  # left diagonal
    [2,4,6]   # right diagonal
  ]

  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(position)
    index = position.to_i - 1
    return index
  end

  def move(index, player)
    return @board[index] = "#{player}"
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return nil
    end
  end

  def turn_count()
    turns = 0
    @board.each do |player|
      if player == 'X' || player == 'O'
        turns += 1
      end
    end
    return turns
  end

  def current_player()
    turns = turn_count()
    turns.even? ? 'X' : 'O'
  end

  def turn()
    puts "Please enter 1-9:"
    position = gets.strip
    index = input_to_index(position)
    valid = valid_move?(index)
    if !valid
      turn()
    else
      move(index, current_player())
      display_board()
    end
  end

  def won?()
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      player = @board[win_index_1]
      if position_taken?(win_index_1)
        win_found = win_combination.all? do |win_index|
          @board[win_index] == player
        end

        if win_found
          return win_combination
        end
      end
    end
    return nil
  end

  def full?()
    not_full = @board.any? do |player|
      player == nil || player == " "
    end

    return not_full ? false : true
  end

  def draw?()
    return (!won?() && full?())
  end

  def over?()
    return (won?() || draw?() || full?())
  end

  def winner()
    return won?() ? @board[won?()[0]] : nil
  end

  def play()
    until over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    end

    if draw?()
      puts "Cat\'s Game!"
    end
  end
end
