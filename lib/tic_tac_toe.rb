class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    puts @board
  end
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"# out the current state.
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    input = input.to_i
    index = input - 1
  end
  def move(index, player = "X")
    @board[index] = player
  end
  def position_taken?(index)
    if @board[index] == "X" || @board[index] =="O"
      return true
    else
      return false
    end
  end
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end
  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player
      move(index, player)

      display_board
    else
      turn
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
    turn_count % 2 == 0? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    !@board.include?(" ")
  end
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end
  def winner
    if win_combination = won?
      @board[win_combination[0]]
    end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
