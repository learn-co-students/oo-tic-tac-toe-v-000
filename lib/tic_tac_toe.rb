class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #top row
      [0,4,8], #diagonal
      [2,4,6], #diagonal
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8] #right column
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(index,value = "X")
    @board[index] = value
  end
  def position_taken?(int)
    if @board[int] == " " || @board[int] == "" || @board[int] == nil
      return false
    else
      return true
    end
  end
  def valid_move?(int)
    if position_taken?(int)
      return false
    elsif int <9 && int >= 0
      return true
    else
      return false
    end
  end
  def turn_count
    count = 0
    @board.each{ |space|
    if space != "" && space != " " && space != nil
      count += 1
    end}
    return count
  end
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
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

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
         false
      end
    end
    return false
  end

  def full?
    @board.all? { |space|
      space == "X" || space == "O"  }
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if won? != false || full? == true
      return true
    else
      false
    end
  end

  def winner
    if won? == false
      return nil
    else
      win_array = won?
    end
    if @board[win_array[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
  def play
    until over? == true || draw? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
