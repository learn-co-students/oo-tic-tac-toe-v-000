class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board=(board)
    @board = board
  end
  def board
    @board
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    input = user_input .to_i - 1
    return input
  end
  def move(index, character = "X")
    @board[index] = character
  end
  def position_taken?(index_number)
    !(board[index_number] == " " || board[index_number] == "" || board[index_number] == nil) 
  end 
  def valid_move?(index_number)
    if index_number.between?(0, 8) && !(position_taken?(index_number))
    return TRUE
    end
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index_number = input_to_index(user_input)
      if valid_move?(index_number) 
      move(index_number, current_player)
      display_board
      else 
      user_input = gets.strip
      end
    end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def won?
    WIN_COMBINATIONS.each do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      all_O = [position_1, position_2, position_3].all? do | element |
        element == "O"
    end
      all_X = [position_1, position_2, position_3].all? do | element |
          element == "X"
    end
    if all_O || all_X
      return win_combination
    end
    
    #if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1== "O" && position_2 == "O" && position_3 == "O")
    #  return win_combination
    # end
    end
    # return false if no winning combination found
    return false
  end
  def full?
    return board.all? {| element | element == "X" || element == "O"}
  end
  def draw?
    if (!won? && full?)
      return true
    else
      return false
    end
  end
  def over?
    (won? || draw?)? true : false
  end
  def winner
  (won?)? board[(won?)[0]] : nil
  end
  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    end
    if winner == "X"
      puts "Congratulations X!"
      elsif winner == "O"
      puts "Congratulations O!"
    end
  end
end


