class TicTacToe

  #def board
  #  @board
  #end

  #def board= (board)
  #  @board = board
  #end

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # left column
  [1,4,7],  # middle column
  [2,5,8],  # right column
  [0,4,8],  # left diagonal
  [2,4,6]  # right diagonal
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input_index)
  return ((user_input_index.to_i) - 1)
  end

  def move(index, current_player)
  @board[index] = current_player
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
     return false
    else @board[index] == "X" || @board[index] == "O"
    return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn_count
  counter = 0
    @board.each do |position|
      if (position == "X" || position == "O")
        counter += 1
      end
    end
  counter
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(index)
      position_taken?(index)
      move(index,current_player)
      display_board
    else turn
    end
  end

  def won?
  WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = @board[win_index_1]
   position_2 = @board[win_index_2]
   position_3 = @board[win_index_3]

     if [position_1, position_2, position_3].all? {|symbol| symbol == "X"}
       return win_combination
     elsif [position_1, position_2, position_3].all? {|symbol| symbol == "O"}
        return win_combination
    end
  end
  false
  end

  def full?
    if @board.include?(nil)
      return false
    elsif @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    won_result = won?
    full_result = full?
    if !won_result && full_result
      return true
    elsif !won_result && full_result
      false
    elsif won_result
      false
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if won?
      win_combination = won?
      if @board[win_combination[0]] == "X"
        return "X"
      elsif @board[win_combination[0]] == "O"
        return "O"
      end
    else
      nil
    end
  end

  def play
    while !over?
     turn
     end

     if won?
      # winner = winner
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat's Game!"
     end
  end


end
