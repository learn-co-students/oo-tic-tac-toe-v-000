class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8],
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    return string.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(position)
    return @board[position] != " "
  end
  
  def valid_move?(position)
    return position.between?(0, 8) && !position_taken?(position)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    new_input = input_to_index(input)
    if valid_move?(new_input)
      move(new_input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |char|
      if char == "X" || char == "O"
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
    WIN_COMBINATIONS.each do |win_combination|
      position_one = win_combination[0]
      position_two = win_combination[1]
      position_three = win_combination[2]
      if (@board[position_one] == "X" && @board[position_two] == "X" && @board[position_three] == "X") || (@board[position_one] == "O" && @board[position_two] == "O" && @board[position_three] == "O")
        return [position_one, position_two, position_three]
      end
    end
    return false
  end

  def full?
    @board.all? {|char| char == "X" || char == "O"}
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
    while !over?
      turn
    end
    
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end