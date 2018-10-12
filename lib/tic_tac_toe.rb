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
  [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
    end
    false
  end

  def full?
    @board.include?(" ") ? false : true
  end

  def over?
    if won?.is_a?(Array)  || full?
      return true
    end
    false
  end

  def draw?
    if full? && won? == false
      return true
    end
    false
  end

  def winner
    if over?
      arr = won?
      player = arr[0]
      return @board[player]
    end
  end

  def turn_count
    turns = 0
    @board.each {|curr| curr != " " ? turns += 1 : turns = turns}
    return turns
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    count = 0
    while count < WIN_COMBINATIONS.length
      win_combination = WIN_COMBINATIONS[count]

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
        count += 1
      end
    end
    false
  end


  def turn
    puts " Please enter 1-9"
    user_input = gets.strip
    user_input = input_to_index(user_input)

    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      puts "this position is either taken or invalid"
      turn
    end
  end


  def play
    until over? || won? != false || draw?
      turn
    end
    if won?.is_a?(Array)
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      return nil
    end
  end
end
