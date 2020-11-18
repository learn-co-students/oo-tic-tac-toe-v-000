class TicTacToe
  attr_accessor :board
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [0, 4, 8], [2, 4, 6]]
              
  def display_board
    puts " #{@board[0]}" + " | " + "#{@board[1]}" + " | " + "#{@board[2]} "
    puts "-----------"
    puts " #{@board[3]}" + " | " + "#{@board[4]}" + " | " + "#{@board[5]} "
    puts "-----------"
    puts " #{@board[6]}" + " | " + "#{@board[7]}" + " | " + "#{@board[8]} "
  end 
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, players_character = "X")
    @board[index] = players_character
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""  || @board[index] == nil
      false
    else
      true
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
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
      elsif
        input=gets.strip
      end
    display_board 
  end
  
  def turn_count
    counter = 0
    @board.each do |grid|
      if grid == "X" || grid == "O"
        counter += 1
      end
    end
    return counter
  end
  
  
  def current_player 
    if turn_count.even?
      "X"
      else 
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == @board[win_combo[1]] &&  @board[win_combo[1]] == @board[win_combo[2]] &&  position_taken?(win_combo[0])
        return win_combo
      end
    end
    false
  end
  
  def full?
    @board.all? do |index| 
      if index == "X" || index == "O"
      true
      end
    end
  end 
  
  def draw?
    if full? && won? == false
      true
    else
      false
    end 
  end  
  
    def over?
      if won? || full?
        true
      elsif draw?
        true
      else  
        false
      end  
    end 
    
  def winner
  winning_combo = won?
  
  if winning_combo != false && winning_combo.all? {| i | @board[i] == "X"}
    "X" 
  elsif winning_combo != false && winning_combo.all? {| i | @board[i] == "O"}
    "O"
  else
    nil
  end 
end  

def play
  turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
end   
  
end 



