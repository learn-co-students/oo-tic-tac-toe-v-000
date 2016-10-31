class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    #Top rows
    [0, 1, 2],
    #Middle Row
    [3, 4, 5],
    #Bottom Row
    [6, 7, 8],
    #Bottom left diagonal
    [6, 4, 2],
    #Bottom Right diagonal
    [8, 4, 0],
    #Top Left vertical
    [0, 3, 6],
    #Middle Right vertical
    [1, 4, 7],
    #Top Right Vertical
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def input_to_index(position)
    position.to_i - 1
  end


  def move(index, token = "X")
    @board[index.to_i - 1] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.to_i.between?(1,9)  && !position_taken?(index.to_i - 1)
  end



  def turn
    puts "Choose a number between 1- 9. 1 signifies the top left corner and 9 signifies the bottom right corner"
    position = gets.strip
  index = input_to_index(position)
    if valid_move?(index)
      move(index, token)
        display_board
    else
      turn
    end
  end


  def turn_count
    counter = 0
   @board.each do|element|
     if element == "X" || element == "O"
       counter+=1
    end
   end
   counter
  end





  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
   end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
    @board[combo[1]] == @board[combo[2]] &&
    position_taken?(@board, combo[0])
   end
  end

  def full?
    @board.all?{|letter| letter == "X" || letter == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
  won? || draw? || full?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end


  def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
   end
  end






end
