class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = 
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

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
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    !position_taken?(index) && 0 <= index && index <= 8 ? true : false
  end
  
  def turn
    puts "Player please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) 
      token = current_player
      move(index, token)
      display_board
    else 
      turn
    end
  end
    
  def turn_count
    @board.count { |token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.none?{ |element| element == " "}
  end

  def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    elsif won?
      return false
    end
  end

  def over?
    if won? != false || draw? || full?
      return true
    end
  end

  def winner
    if !won? || draw? 
      return nil
    end
    winning_line = won?
    index = winning_line[0]
    return @board[index]
  end

  def play
    while !over?
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end