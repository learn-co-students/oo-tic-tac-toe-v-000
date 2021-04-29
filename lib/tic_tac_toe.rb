class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], #win_combination
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(userInput)
    index = userInput.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8) == true
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    userInput = gets.strip
    index = input_to_index(userInput)
    if valid_move?(index) == true
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each { |space|
      if space == "X" || space == "O"
        counter+=1
      end
    }
    counter
  end

  def current_player
    if turn_count%2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
 
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination # return the win_combination indexes that won.
      end
    end
    return FALSE
  end

  def full?
    @board.all? { |space| space == "X" || space == "O"}
  end

  def draw?
    if won? == FALSE && full? == TRUE
      return TRUE
    else
      return FALSE
    end
  end

  def over?
    if won? != FALSE || full? == TRUE || draw? == TRUE
      return TRUE
    end
  end

  def winner
    if won? != FALSE
      index = won?
      if @board[index[0]] == "X" || @board[index[0]] == "O"
        return @board[index[0]]
      end
    end
  end

  def play
    until over? == TRUE
      turn
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == TRUE
        puts "Cat's Game!"
      end
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == TRUE
      puts "Cat's Game!"
    end
  end
end