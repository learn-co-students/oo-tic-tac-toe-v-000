class TicTacToe
   def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
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
    input = input.to_i - 1
end

  def move(index, token = "X")
    @board[index] = token
    display_board
end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
    count += 1
  end
end
count
end

  def current_player
  turn_count.even? ? "X" : "O"
end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "Sorry, that was an invalid move."
      turn
    end
  end

def won?
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]
    win1 = current_combo.all? {|position| @board[position] == "X"}
    win2 = current_combo.all? {|position| @board[position] == "O"}
    if win1 || win2
      return current_combo
    else
    end
    combo += 1
  end
end

 def full?
   @board.none? {|blank| blank == " " || blank.nil?}
 end

 def draw?
  if full? && !won?
   return true
   puts "Cat's Game!"
 else
   return false
 end
 end

def over?
  won? || draw?
end

def winner
  if won?
    return @board[won?[0]]
  else
  end
end

 def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
