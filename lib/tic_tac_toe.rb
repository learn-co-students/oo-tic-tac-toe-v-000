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
  [2,4,6],
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

   def move(index,player = "X")
    @board[index] = player
   end

   def position_taken?(index)
     if @board[index] == "" || @board[index] == " " || @board[index] == nil
       false
     else
       true
     end
  end

  def valid_move?(index)
    if index.between?(0, 8) == true && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      else
        counter += 0
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    else turn_count.odd?
      "O"
    end
  end

   def turn
     puts "Please enter 1-9:"
     user_input = gets.strip
     index = input_to_index(user_input)
     player = current_player
     if valid_move?(index) == true
       move(index,player)
       display_board
     else
       turn
     end
   end

   def won?
  WIN_COMBINATIONS.find do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]

    position_1 == position_2 && position_2 == position_3 && position_taken?(index_1)
  end
end

def full?
  WIN_COMBINATIONS.all? do |space|
    index_1 = space[0]
    index_2 = space[1]
    index_3 = space[2]

    @board[index_1] != " " && @board[index_2] != " " && @board[index_3] != " "
  end
end

def draw?
  if full? == true && won? == nil
    true
  else
    false
  end
end

def over?
  if won?
    true
  elsif draw?
    true
  else
    false
  end
end

def winner
  result = won?
  if result
    winning_index_position = result[2]
    @board[winning_index_position]
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
