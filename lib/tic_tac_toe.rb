class TicTacToe 
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [2, 4, 6], # diagonal
    [0, 4, 8], # diagonal
    [0, 3, 6], # left coloumn
    [1, 4, 7], # middle coloumn
    [2, 5, 8]  # left coloumn
    ]
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player_token = "X")
    @board[index] = player_token
  end 
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn 
    puts "Please enter 1-9"
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
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination| 
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 === "X" && position_2 === "X" && position_3 === "X"
      return win_combination
    elsif position_1 === "O" && position_2 === "O" && position_3 === "O"
      return win_combination
      end
    end
    return false
  end
  
  def full?
    @board.all?{|token| token === "X" || token === "O"}
  end 
  
  def draw?
    if won? === false && full?
      return true 
    else 
      return false
    end
  end
  
  def over?
    won? || full?|| draw?
  end
  
  def winner
    if won? === false 
      return nil
    end
    winning_index = won?
    winning_index.each do |index| 
    if @board[index] === "X"
      return "X"
    elsif @board[index] === "O"
      return "O"
    end
    end
  end
  
  def play
    until over?
    turn
    end
    if winner === "X"
      puts "Congratulations X!"
    elsif winner === "O"
      puts "Congratulations O!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end 




