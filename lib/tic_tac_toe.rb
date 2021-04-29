class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    index = input.to_i - 1
  end
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end
  
  def turn_count
    counter = 0
    @board.each { |space| counter += 1 if space.strip.length == 1 }
    counter
  end
  
  def current_player
    if turn_count % 2 == 0
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
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        winner = "X"
        return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        winner = "O"
        return win_combination
      end
    end
    false
  end
  
  def full?
    if @board.count("X") + @board.count("O") == 9
      true
    end
  end
  
  def draw?
    if (won? == false || nil) && full?
      # full? && !won?
      true
    end
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    win_combination = won?
    @board[win_combination[0]] if win_combination
  end
  
  def play
    until over?
      turn
    end
    puts (draw? ? "Cat's Game!" : "Congratulations #{winner}!")
  end
  
end
