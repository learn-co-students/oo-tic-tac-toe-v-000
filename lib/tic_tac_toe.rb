class TicTacToe
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

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " " && space != ""
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def valid_move? (index)
    if (position_taken?(index) == false) && index >= 0 && index <= 8
      return true
    end
  end

  def position_taken? (index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
      return false
    else
      return true
    end

  end

  def move(index, token)
    @board[index] = token
  end

  def input_to_index(input)
    return input.to_i - 1
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

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]



      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination

      end
    end
    return false
  end


  def full?
    @board.none?{|location| location == " "}
  end

  def draw?
    if won? == false && full? == true
      return true
    end
  end

  def over?
    if won? || draw? == true
      return true
    end
  end

  def winner
    if won?
      wins = won?
      piece = @board[wins[0]]
      if piece == "X"
        return "X"
      elsif piece == "O"
        return "O"
      end
    else
      return nil
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
