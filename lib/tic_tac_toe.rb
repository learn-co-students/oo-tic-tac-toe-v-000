class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

  WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

  def input_to_index(input)
    input.to_i-1
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

  def move(index, token ="X")
    @board[index] = token
   end

   def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
   end

   def valid_move?(index)
     if index.between?(0, 8) && !position_taken?(index)
       return true
     else
       return false
     end
   end

   def turn
     puts "Please enter 1-9:"
     token = current_player
     input = gets.strip
     index = input_to_index(input)
     if valid_move?(index)
       move(index,token)
       display_board
     else
       turn
     end
   end

   def turn_count
     count = 0
     @board.each do |token|
      count += 1 if token == "X" || token == "O"
     end
    count
  end

  def won?
    WIN_COMBINATIONS.each do |winning|
      pos1 = @board[winning[0]]
      pos2 = @board[winning[1]]
      pos3 = @board[winning[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
        return winning
      end
    end
    return false
  end

  def full?
  @board.all? do |winning|
    position_taken?(@board.index(winning))
  end
end

def draw?
  if full? && !won?
    return true
  elsif won?
    return false
  else !won? && !full?
    return false
 end
 end

 def over?
   won? || draw?
 end

 def winner
  if won?
    array = won?
    winner = @board[array[0]]
    return winner
  else
    return nil
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
 end
end
end
