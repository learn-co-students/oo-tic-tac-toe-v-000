class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  
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
  
  def move(board_index, player_char = "X")
    @board[board_index] = player_char
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move? (index)
    if index > 8 || index < 0
      return false
    else
      return !position_taken?(index)
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input = input_to_index(input)
  
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    return count
  end
  
  def current_player
    # X for 1st move, O for 2nd, etc.
    turn_count % 2 == 0 ? "X":"O"
  end
  
  def won?
    position = []
    
    WIN_COMBINATIONS.each do |win|
      win.each do |index|
        position << position_taken?(index)
      end
  
      all_true = position.all? do |pos| 
        pos 
        end
        
      if all_true
        if @board[win[0]] == @board[win[1]] && @board[win[0]] == @board[win[2]]
          return win
        else
          position = []
        end
        
      else
        position = []
      end
    end
    return false
  end
  
  def full?
    full = @board.none? {|index| index == " " || index == nil }
  end
  
  def draw? 
    win = won?
    full = full?
    
    if !win && full
      return true
    else
      return false
    end
  end
  
  def over?
    win = won?
    full = full?
    draw = draw?
    
    if win || full || draw
      return true
    else
      return false
    end
  end
  
  def winner
    x_or_o = won?
    if x_or_o == false
      return nil
    else
      return @board[x_or_o[0]]
    end
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