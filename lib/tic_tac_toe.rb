class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom row
    [0,3,6], #First Column
    [1,4,7], #Second Column
    [2,5,8], #Third Column
    [0,4,8], #Left to right diaganol
    [6,4,2]  #Right to left diaganol
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    count = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    count = turn_count
    player = count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] 
        if @board[combo[0]] == "X" || @board[combo[0]] == "O"
          return combo
        end
      end
    end
    return false
  end

  def full?
    @board.each do |i|
      if i != "X" && i != "O"
        return false
      end
    end
    return true
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
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end