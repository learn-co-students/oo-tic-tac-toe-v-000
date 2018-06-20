class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1
    return index
  end
  
  def move(index, current_player="X")
    # index = input_to_index(input)
    @board[index]= current_player
    # update_array_at_with(adjusted_input, current_player)
    # display_board
  end
  
  def valid_move?(index)
      if (index > 8 || index < 0 || index % 1 != 0 || position_taken?(index) == true)
        false
      else true
    end
  end
  
  def position_taken?(index)
      if (@board[index] == "" || @board[index] == " " || @board[index] == nil)
        false
      else true
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player 
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def won?
     WIN_COMBINATIONS.each do |win_combination|
      if @board[win_combination[0]]==@board[win_combination[1]]&&@board[win_combination[0]]==@board[win_combination[2]]&&@board[win_combination[0]]!=" "
        return win_combination
        end
      end
    false
  end
  
  def full?
    if @board.any? { |i| i == " " }
      return false
    end
    true
  end
  
  def draw?
    if (won? == false && full? == true)
      return true
    end
    false
  end
  
  def over?
    if (won? != false && full? == true)
      return true
    elsif (won? != false && full? == false)
      return true
    elsif draw? == true
      return true
    else (won? == false && full? == false)
      return false
    end
  end
  
  def winner
    if won? == false
      return nil
    else 
      win_combination = won?
        winner = @board[win_combination[0]]
        return winner
    end
  end
  
  def play
    until over? == true
      turn
    end
    if won? != false
      won_player = winner
      puts "Congratulations #{won_player}!"
    end
    if draw? == true
      puts "Cat's Game!"
    end
  end
end