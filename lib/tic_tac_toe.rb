class TicTacToe
  def initialize
    #sets an @board variable equal to a new, empty array of 9 positions. 
    @board = Array.new(9, " ") 
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6], 
    [1, 4, 7], 
    [2, 5, 8], 
    [0, 4, 8], 
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(position)
    index = position.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player    
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    turn_count = 0 
    @board.each do |position|
      if position == "X" || position == "O"
        turn_count += 1 
      end
    end
    turn_count  
  end
  
  def current_player
    turn_count.even? ?  "X" :  "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
      #winning_combo could be [0, 1, 2], [3, 4, 5]...
      (@board[winning_combo[0]] == @board[winning_combo[1]]) && 
        (@board[winning_combo[1]] == @board[winning_combo[2]]) && (@board[winning_combo[0]] != " ")
    end
  end
  
  def full?
    @board.all? do |position|
      position == "X" || position == "O" 
    end
  end
 
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    #first test if there WAS a winner yet, 
    #& if so, find out which player token (X or O)
    #otherwise if  no winner, return nil. 
    if won?
      #if no winner, then this IF is falsey, so winner() returns nil. 
      #If won? is true, board[won?(board)[0]] (if there WAS a winner) 
      @board[won?[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end  
  end
 
end