class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], #top row 
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,3,6], #left col 
    [1,4,7], #mid col 
    [2,5,8], #right col 
    [0,4,8], #l>r diag 
    [2,4,6]  #r>l diag 
  ]
  def initialize
    @board = Array.new(9, " ")
  end
  
  def turn_count
    @board.count{ |token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count.even? == true ? "X" : "O"
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
  
  # Validation methods: 
  # #won?, #full?, #draw?, #over?, #position_taken?, #valid_move?
  def won?
    won = false
    WIN_COMBINATIONS.each do |combo|
      if (combo.all?{|i| position_taken?(i=i)}) && (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]) 
          won = combo
      end
    end
    won
  end
  
  def full?
    @board.all?{|space| space == "X" || space == "O"}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def position_taken?(i=@index)
    !(@board[i].nil? || @board[i] == " ")
  end
  
  #had to use default arg to satisfy tests 
  def valid_move?(i=@index)
    i.between?(0,8) && !position_taken?(i=i)
  end
  
  # checks to see who is the winner, returns X, O, or nil 
  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end
  
  # in order to pass the test, had to use arguments
  # personally perfer this without arguments using
  # #current_player, @index
  def move(i = @index, player=current_player)
    @board[i] = player
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index(input)
    if valid_move?
      move
      display_board
    else
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
