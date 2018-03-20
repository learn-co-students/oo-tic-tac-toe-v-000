class TicTacToe 
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",])
    @board = board 
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
  
  def input_to_index(input)
    index = input.to_i - 1 
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
    if (@board[index] == nil) || (@board[index] == " ")
     return false  
    else (@board[index] == "X") || (@board[index] == "O")
      return true 
    end 
  end 
  
  def valid_move?(index)
    if (!position_taken?(index)) && (index.between?(0, 8)) 
      return true 
    else 
      return false || nil 
    end 
  end 
  
  def turn_count
    turn_count = 0 
    @board.each do |position|
      if (position == "X") || (position == "O")
        turn_count += 1 
      end 
    end 
    return turn_count
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end 
  end 
  
  def turn 
    puts "Please enter 1-9: "
    input = gets.strip   
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      puts "Please enter 1-9: "
      input = gets.strip 
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.each do |combos|
      if ((@board[combos[0]] == "X") && (@board[combos[1]] == "X") && (@board[combos[2]] == "X")) || ((@board[combos[0]] == "O") && (@board[combos[1]] == "O") && (@board[combos[2]] == "O"))
        return combos 
      end
    end 
  nil 
  end
  
  def full?
    @board.all? do |position|
      (position == "X") || (position == "O")
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
      return true 
    else 
      return false 
    end 
  end 
  
  def winner
    if win = won?
      @board[win[0]] 
    end
  end 

  def play 
    puts "Welcome to Tic Tac Toe!"
     until over? == true 
        turn 
      end 
    if won?  
      puts "Congratulations #{winner}!"
    else draw? 
      puts "Cat's Game!"
    end 
     
  end 
    
end 