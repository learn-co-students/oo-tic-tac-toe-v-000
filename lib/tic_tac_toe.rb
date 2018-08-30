class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = 
  
  [0,1,2], #Top row 
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left Column
  [1,4,7], #Middle Column
  [2,5,8], #Right Column
  [0,4,8], #Left Diagnol
  [2,4,6] #Right Diagnol
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
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
    if !index.between?(0,8) || @board[index] == "X" || @board[index] == "O"
        false
    else 
      true
    end
  end
  
    def turn_count
      counter = 0
       @board.each do |token| 
         if token == "X" || token == "O" 
           counter += 1
          end
        end
      counter
    end
    
    
  def current_player
    if turn_count % 2 == 0 
      "X"
    else 
      "O"
    end
  end
    
    
  def turn 
    puts "Please enter a position between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  
  
  def won? 
    win_index_1 = WIN_COMBINATIONS[0]
    win_index_2 = WIN_COMBINATIONS[1]
    win_index_3 = WIN_COMBINATIONS[2]
    win_index_4 = WIN_COMBINATIONS[3]
    win_index_5 = WIN_COMBINATIONS[4]
    win_index_6 = WIN_COMBINATIONS[5]
    win_index_7 = WIN_COMBINATIONS[6]
    win_index_8 = WIN_COMBINATIONS[7]
    
    if win_index_1.all? { |position| @board[position] == "X"} || win_index_1.all? {|position| @board[position] == "O"}
      win_index_1
    elsif win_index_2.all? { |position| @board[position] == "X"} || win_index_2.all? {|position| @board[position] == "O"}
      win_index_2
    elsif win_index_3.all? { |position| @board[position] == "X"} || win_index_3.all? {|position| @board[position] == "O"}
      win_index_3
    elsif win_index_4.all? { |position| @board[position] == "X"} || win_index_4.all? {|position| @board[position] == "O"}
      win_index_4
    elsif win_index_5.all? { |position| @board[position] == "X"} || win_index_5.all? {|position| @board[position] == "O"}
      win_index_5
    elsif win_index_6.all? { |position| @board[position] == "X"} || win_index_6.all? {|position| @board[position] == "O"}
      win_index_6
    elsif win_index_7.all? { |position| @board[position] == "X"} || win_index_7.all? {|position| @board[position] == "O"}
      win_index_7
    elsif win_index_8.all? { |position| @board[position] == "X"} || win_index_8.all? {|position| @board[position] == "O"}
      win_index_8
    else
      false
    end
  end
  
  def full?
    if @board.all? { |token| token == "X" || token == "O" }
      true
    end
  end
  
  def draw?
    if !won? && !full?
        false
    elsif won?
        false
    else 
      true
    end
  end
  
  def over?
    if won? || full? || draw?
      true
    end
  end
  
  def winner
    win_combo = won?
    if won?
      @board[win_combo[0]]
    end
  end 
  
  def play
    until over? == true 
     turn 
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end