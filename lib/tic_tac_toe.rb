class TicTacToe
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
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
    separator = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts separator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts separator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    return user_input.to_i - 1
  end
  
  def move(index, current_player="X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    if @board[index] != " " && @board[index] != ""
      return true
    else
      return false
    end
  end
  
  def valid_move?(index)
    if index.between?(0,9) && !position_taken?(index)
        return true
    end
  end
  
  def turn
    puts "Please enter a number between 1 and 9"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    num_of_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        num_of_turns += 1
      end
    end
    return num_of_turns
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index1 = combo[0]
      win_index2 = combo[1]
      win_index3 = combo[2]
      
      if @board[win_index1] == "X" && @board[win_index2] == "X" && @board[win_index3] == "X"
        return combo
      elsif @board[win_index1] == "O" && @board[win_index2] == "O" && @board[win_index3] == "O"
        return combo
      end
    end
    false
  end
  
  
  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end
  
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      true
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    end
  end
  
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end