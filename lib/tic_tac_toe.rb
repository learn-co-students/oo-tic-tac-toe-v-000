class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  # horizontal wins
   [0,1,2], # top row
   [3,4,5], # middle row
   [6,7,8], # bottom row
  #vertical wins
   [0,3,6], # left column
   [1,4,7], # middle column
   [2,5,8], # right column
  # diagonal wins
   [0,4,8], # top left to bottom right diagonal
   [2,4,6] # top right to bottom left diagonal
  ]

  def move(index, token = "X")
      index = index - 1
      @board[index] = token
  end

  def position_taken?(index)
   if @board[index].nil? || @board[index] == " "
     return false
   else
     return true
   end
  end

  def valid_move?(position)
    position = position.to_i - 1
    position.between?(0, 8) && !position_taken?(position)
  end

  def turn
    #ask for input
    puts "Please enter 1-9: "
    #get input
    input = gets.chomp
    position = input.to_i
    #if input is valid
    if valid_move?(position)
      #make the move for input
      move(position, current_player)
      #show the board
      display_board
    #else
    else
      turn
    end
  end

  def find_win_combo
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      return win_combination
    end
  end
end

  def won?
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

     if position_1 == position_2 && position_2 == position_3 && position_1 != " "
       return true
     end
   end
   return false
  end

  def full?
   if @board.include?(" ") || @board.include?(nil)
    return false
   else
    return true
   end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end


  def winner
    win_combo = find_win_combo
    if won?
      return @board[win_combo[0]]
    end
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

  def play

    until over?
      turn
    end

    if won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cats Game!"
    end
  end
end
