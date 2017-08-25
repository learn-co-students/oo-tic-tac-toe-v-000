class TicTacToe
  def initialize
    @board = Array.new(9," ")
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
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(index)
    cus = index.to_i
    return cus - 1
  end

  def move(position, char = "X")
    @board[position] = char
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == ""
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    else return false
    end
  end

  def valid_move?(index)
    if (index).between?(0,8) && !position_taken?(index)
      return true
    elsif position_taken?(index)
      return false
    end
  end

  def turn_count
    count = 0
    @board.each do |item|
      if item != " " && item != ""
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count.even? ? "X":"O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
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

      if position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)
        if  position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
        end
      end
    end
    return false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if !won?
      if full?
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
    elsif won?
      return true
    elsif full? && !won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      combi = won?
      return @board[combi[0]]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      char = winner
      puts "Congratulations #{char}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
