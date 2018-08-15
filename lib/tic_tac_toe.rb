class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                   [0,3,6], [1,4,7], [2,5,8],
                   [0,4,8], [2,4,6]]
  
  def input_to_index(user_input)
    user_number = user_input.to_i
    position = user_number - 1
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def move(position, player_token)
    @board[position] = player_token
  end

  def position_taken?(position)
    !(@board[position].nil? || @board[position] == " ")
  end
  
  def valid_move?(position)
  if !position_taken?(position) && position.between?(0,8)  
    true 
  else 
    false
  end
end

def turn
  player_token = current_player
  puts "Please enter 1-9:"
  user_input = gets.strip
  position = input_to_index(user_input)
  if valid_move?(position)
    move(position, player_token)
    display_board
  else
    turn
  end
end

def current_player
  if turn_count % 2 == 0 
    player_token = "X"
    return player_token
  else 
    player_token= "O"
    return player_token 
  end 
end 

def won?
  won = false 
  x_counter = 0
  o_counter = 0 
  win_combo_1 = WIN_COMBINATIONS[0]
  win_combo_2 = WIN_COMBINATIONS[1]
  win_combo_3 = WIN_COMBINATIONS[2]
  win_combo_4 = WIN_COMBINATIONS[3]
  win_combo_5 = WIN_COMBINATIONS[4]
  win_combo_6 = WIN_COMBINATIONS[5]
  win_combo_7 = WIN_COMBINATIONS[6]
  win_combo_8 = WIN_COMBINATIONS[7]
  
  win_combo_1.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
  
  if x_counter == 3 || o_counter == 3 
      won = win_combo_1
      return won  
  end
  
  won = false 
  x_counter = 0
  o_counter = 0
  win_combo_2.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_2
      return won  
  end
  
  won = false 
  x_counter = 0
  o_counter = 0
  win_combo_3.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_3
      return won  
  end
  
  won = false 
  x_counter = 0
  o_counter = 0
  win_combo_4.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_4
      return won  
  end
 
  won = false 
  x_counter = 0
  o_counter = 0 
 win_combo_5.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_5
      return won  
  end
  
   won = false 
  x_counter = 0
  o_counter = 0
   win_combo_6.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_6
      return won  
  end
 
  won = false 
  x_counter = 0
  o_counter = 0 
 win_combo_7.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_7
      return won  
  end

 won = false 
  x_counter = 0
  o_counter = 0
 win_combo_8.each do |square|
    if @board[square] == "X"
      x_counter = x_counter + 1
    end 
    if @board[square] == "O"
      o_counter = o_counter + 1
    end 
  end
    
  if x_counter == 3 || o_counter == 3 
      won = win_combo_8
      return won  
  end
  return won 
end 

def full?
  full = false 
  full_counter = 0 
  @board.each do |square|
    if square == "X" || square == "O"
      full_counter = full_counter + 1
    end 
    if full_counter == 9
      full = true
    end
  end
  return full 
end

def draw?
  if won? == false && full? == true  
    return true 
  else 
    return false 
  end 
end

def over?
  if won? != false || draw? == true 
    return true 
  else 
    return false 
  end
end 

def winner
  if won? != false
    combo = won?
    if @board[combo[0]] == "X"
      return "X"
    else 
      return "O"
    end
  else 
    return nil 
  end 
end

def play
  until over? 
    turn
  end
  
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end 
end 
end 