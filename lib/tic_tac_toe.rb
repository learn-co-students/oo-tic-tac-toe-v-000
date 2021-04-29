class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
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

  def move(index, token = "X")
    @board[index] = token
  end

  #declare #position_taken? boolean
  def position_taken?(index)
  #true if board index is not blank
    @board[index] != " "
  end


  #declare #valid_move? boolean
  def valid_move?(index)
  #true if player move is on board and #position_taken? is false
    index.between?(0,8) && !position_taken?(index)
  end

  #declare #turn
  def turn
    puts "Please enter 1-9:"
  #create variable to store input from user
    input = gets.strip
  #create variable for converting user input to array location
    index = input_to_index(input)
  #check if #valid_move? is true, then run #move and #display_board
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
  #if #valid_move? false, run #turn until true
      turn
    end
  end

#define #turn_count
  def turn_count
  #declare starting turns count
    turns = 0
  #iterator to loop over each position in array
    @board.each do |position|
  #check each position in array to see if not empty
      if position != " "
  #if either player is in position, add to turns count
        turns += 1
      end
  #if not in position, loop to next position until all are checked
    end
  #returns the total current turns count
    turns
  end

  #current_player
  def current_player
  #takes #turn_count and checks if even, then(?) gives value of X, else(:) it is O
    turn_count.even? ? "X" : "O"
  end

  #defining a check if a player has won
  def won?
  #Pass each array entry into a block (index), and find return of true
    WIN_COMBINATIONS.detect do |index|
    #search the board at index 0 and compare to board index 1 to see if true
      @board[index[0]] == @board[index[1]] &&
    #search the board at index 1 and compare to board index 2 to see if true
      @board[index[1]] == @board[index[2]] &&
    #run position_taken? method to see if true at index 0 of board
      position_taken?(index[0])
    end
  end

  #define full? to check if board is full
  def full?
  #Return true if all positions are not blank
    @board.all?{|token| token != " "}
  end

  #define draw? to see if there is a draw
  def draw?
  #draw? == true if full? method is true and won? method is false
    full? && !won?
  end

  #define over? to see if game is over
  def over?
  #over? == true if won? is true OR draw is true. There is no need to
  #check for full, as a full board will happen if there is a draw.
    won? || draw?
  end

  #define winner
  def winner
  #Check if #won? is true
    if winning_move = won?
  #return first instance of  #won? on board
      @board[winning_move.first]
    end
  end

  #define play function
  def play
  #run #turn until #over? is true
    turn until over?
  #puts #winner if true, else "Cats game"
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
