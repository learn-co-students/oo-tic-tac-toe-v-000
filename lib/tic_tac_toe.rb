class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  def board=(board)
    @board = board
  end
  def board
    @board
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
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token 
  end
  
  def position_taken?(index)
    if !(@board[index].nil? || @board[index] == " ")
      true 
    else
      false
    end 
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true 
    else
      false
    end
  end
  
  def turn 
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true 
      move(index, current_player) 
      display_board
    elsif valid_move?(index) == false 
      turn 
    end 
  end
  
  def turn_count
    counter = 0
    @board.each do |turn|
      if (turn == "X" || turn == "O")
    counter += 1 
      end 
    end
  counter
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[0])
    end
  end
  
  def full?
    @board.all? do |token|
      if (token == "X" || token == "O")
        true 
      else 
        false 
      end
    end
  end
  
  def draw?
    won? == nil && full? == true  
  end
  
  def over?
    if (won? || draw? || full?) || (won? && !full?)
    true
  elsif (!won? || !draw? || !full?)
    false
  end  
  end
  
  def winner
    if won? == nil
      nil 
    elsif board[won?[0]] == "X"
      "X"
    elsif board[won?[0]] == "O"
      "O"
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