class TicTacToe

  # @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def current_player
    # sets the count iterator
    count = 0
    # starts looping through the board array
    @board.each do |spot|
      # if an index position in the board array isn't empty, then
      # the count counter gets increased by one.
      if spot != " "
        count += 1
      end

      # returns the total moves. if index 0 is full because someone made the first move,
      # then the count will be 1.

    end
    # count.even? "X" : "O"
    if count.even?
      "X"
    else
      "O"
    end

  end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

# Define your play method below

def play
  while ! over?
    turn
  end
    if winner == "X"
     puts "Congratulations X!"
   elsif  winner == "O"
     puts "Congratulations O!"
   elsif draw?
     puts "Cat's Game!"
    end

end


def full?
  @board.all? {|letter| letter == "X" || letter == "O"}
end

def draw?
  full? && won? == false
    # if board array is full at all posiotions, but also returns false for won Method
    # then its a draw.
end

# try to take a second sometimes and step back and think from an english perspective,
# the overview. easy to get lost in code details and lose sight of larger contxt
# helps to step back...for 'over'. the two ways that a game can be over are someone
# wins or it's a tie.
# what am i trying to do, what is already working, and how does it relate to what needs to gets# working.
# how is what's happening right now, different from what i'm expecting. and why?

def over?
   won? || draw?
end

def winner
  if won? == false
    nil
  else
    x = won?
    @board[x[0]]
  end
end

def turn_count
  count = 0
  @board.each do |spot|
    if spot != " "
      count += 1
    end
  end
  count
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
    end
  end
  false
end

end
