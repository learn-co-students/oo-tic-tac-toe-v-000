class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8], 
    [0, 4, 8], [2, 4, 6]]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
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
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index] == nil || @board[index] == "" || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      position0 = @board[combo[0]]
      position1 = @board[combo[1]]
      position2 = @board[combo[2]]
      if (position0 == "X" && position1 == "X" && position2 == "X") ||
        (position0 == "O" && position1 == "O" && position2 == "O")
        return combo
      end
    end
    return nil
  end
  
  def full?
    @board.all?{|space| space == "X" || space == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    win_combo = won?
    if win_combo
      @board[win_combo[0]]
    else
      nil
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index)
      input = gets.strip
      index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end