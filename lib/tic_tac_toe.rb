class TicTacToe

  def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_int = input.to_i
    index = input_int - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == true
      return false
    elsif @board.empty? == true && index.between?(0, 8)
      return true
    elsif @board.empty? == false && index.between?(0, 8)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
          counter +=1
      end
    end
    return counter
  end

  def current_player
    turns_played = turn_count
    turns_played.even? ? "X" : "O"
  end

  def won?
      WIN_COMBINATIONS.each do |win_combination|
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination # return the win_combination indexes that won.
        else
          false
        end
      end
    return false
  end

  def full?
    @board.all? do |position|
      if position == "X" || position == "O"
        true
      else position == " "
        false
      end
    end
  end

  def draw?
      if !won? && full?
      true
    elsif !won? && !full?
      false
    else won?
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    winning_combination = won?

    if won?
      winning_index = winning_combination[0]
      winning_token = @board[winning_index]
      return winning_token
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
