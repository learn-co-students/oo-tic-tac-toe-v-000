class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    return index
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      else
        
      end
    end
    return counter
  end
  
  def current_player
    game_turn = turn_count
    if game_turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end
    
  def won?
    WIN_COMBINATIONS.each do |combination|
        if (@board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O") || (@board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X")
          return combination
        else
          
        end
    end
    return false
  end
  
  def draw?
    if turn_count == 9 && won? == false
      return true
    else
      return false
    end
  end
  
  def full?
    @board.each do |position|
      if position == "" || position == " " || position == nil
        return false
      else
        
      end
    end
    return true
  end
  
  def over?
    if turn_count < 9 && won? == false
      return false
    elsif draw?
      return true
    elsif won? != nil
      return true
    end
  end
  
  def winner
    if won? == false
      return nil
    else
      return @board[won?[0]]
    end
  end
  
  def play
    while over? == false
      turn
      if draw?
        puts "Cat's Game!"
        return
      end
    end
    
    while over?
      if draw?
        puts "Cat's Game!"
        return
      else
        puts "Congratulations #{winner}!" 
        return
      end
    end
  end
end