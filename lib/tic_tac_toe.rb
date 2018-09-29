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
    [0, 4, 8],
    [2, 4, 6]
    ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input) 
    return user_input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      return true 
    elsif position_taken?(index) == true
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |n|
      if n == "X" || n == "O"
        count += 1
      end
    end
    count
    end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else return "O"
    end
  end
  

  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? { |n| @board[n] == "X" }
        return win_combination
      elsif win_combination.all? { |n| @board[n] == "O" }
        return win_combination
      end
    end
    if @board.none? { |n| n == "X" or "O" }
      return false
    end
  end


  def full?
    if  @board.all? { |n| n == "X" or n == "O" } 
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if draw?
      return true
    end
  
    if won?
      return true
    end
  end
  
  def winner
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? { |n| @board[n] == "X" }
        return "X"
      elsif win_combination.all? { |n| @board[n] == "O" }
        return "O"
      end
    end
    
      if !won?
        return nil
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