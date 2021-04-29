class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],   # Bottom row
    [0,3,6],    # Left column
    [1,4,7],     # Middle column
    [2,5,8],      # Right column
    [0,4,8],       # Left diagonal
    [2,4,6]         # Right diagonal
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

  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    turns_taken = 0
    @board.each do |occupied_position|
      if occupied_position == "X" || occupied_position == "O"
        turns_taken +=1
      end
    end
    turns_taken
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?                               #for each win_combination in WIN_COMBINATIONS
    WIN_COMBINATIONS.each do |win_combination|    #win_combination is a 3 element array of indexes that compose a win

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
      end
    end
    false
  end #find/detect


  def full?
    @board.all? { |value| value == "X" || value == "O" }
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if won? || draw? || full?
      return true
    end
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
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
