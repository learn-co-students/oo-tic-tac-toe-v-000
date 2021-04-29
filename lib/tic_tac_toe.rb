class TicTacToe
  def initialize
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    @board = board
  end

  # Define your WIN_COMBINATIONS constant
   WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2],

   ]

  # Helper Methods
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  #Turn-count
  def turn_count
     turn_count= 0
      @board.each do |space|
        "number of turns played is #{space}"
        if space == "X" || space == "O"
            turn_count += 1
       end
      end
    turn_count
   end


#current_player
  def current_player
  if turn_count.even?
     "X"
  else
    "O"
  end
  end



  def won? #['','','X','X','X','X']

    WIN_COMBINATIONS.each do |win_combination|
       # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
       # grab each index from the win_combination that composes a win.
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1] # load the value of the @board at win_index_1
       position_2 = @board[win_index_2] # load the value of the @board at win_index_2
       position_3 = @board[win_index_3] # load the value of the @board at win_index_3

       if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination # return the win_combination indexes that won.
      elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
       end
     end
     false

  end


  def full?
     # are there any? empty spaces on the @board
     # OR are all? of the spaces either "X" or "O"
     #WIN_COMBINATIONS.all? do |win_combination|
      @board.all? do |element|
      element == "X" || element == "O"

     end

  end

  def  draw?
        full? && !won?
  end

  def over?
     draw? || won?

  end

  #example
  #@board = ["", "", "", X", "X", "X"....]
  #winner1 = [3,4,5]
  #winner1[0] /3
  #@board[winner1[0]]


  def winner
    if winner1 = won?
      @board[winner1[0]] #pass in winner1 into @board
    end
  end


  # Define your play method below
  # Everyline in your program return something. work at one at a time.
  def play
    turn until over?

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end

  end

end
