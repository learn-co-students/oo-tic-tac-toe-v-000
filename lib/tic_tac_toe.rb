
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],  [0, 3, 6],  [0, 4, 8],
    [3, 4, 5],  [1, 4, 7],  [2, 4, 6],
    [6, 7, 8],  [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |index|
      win_index_1 = index[0]
      win_index_2 = index[1]
      win_index_3 = index[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return index
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return index
      end
    end
    false
  end

  def full?
    outcome = @board.all? do |type|
      type == "O" || type == "X"
    end
    if outcome == true
      true
    else
      false
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    end
    false
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    end
    false
  end

  def winner
    if won? != false
      index = won?
      index.each do |type|
        if @board[type] == "X"
          return "X"
        else
          return "O"
        end
      end
    end
    nil
  end

  def play
    until over?
      turn
    end
    if won?
        puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
