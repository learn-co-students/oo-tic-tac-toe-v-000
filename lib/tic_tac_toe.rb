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
                    [6,4,2]]

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
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
      if valid_move?(input) && turn_count.even? == true
        move(input, "X")
      elsif valid_move?(input) && turn_count.odd? == true
        move(input, "O")
      else
        turn
      end
  display_board
end

  def turn_count
    total = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        total +=1
      end
    end
  return total
end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combos|
      if combos.all? {|possible| @board[possible] == "X"} || combos.all?{|possible| @board[possible] == "O"}
        return combos
      end
    end
  return false
end

  def full?
    @board.none? {|spots| spots == " "}
  end

  def draw?
      if full? == true && won? == false
        return true
      end
    return false
  end

  def over?
    if draw? == true || won? != false
      return true
    else
      return false
    end
end

  def winner
    player = won?
      if won? == false
      return nil
      end

      if @board[player[0]] == "X"
        return "X"
      else
        return "O"
      end
  end

  def play
    until over? == true
      turn
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      else
        puts "Cats Game!"
      end
  end

end