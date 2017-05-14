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
    [6, 4, 2]
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
  
  def move(index, current_player = 'X')
    @board[index] = current_player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player()
      move(index, player)
      display_board()
    else
      turn()
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |i|
      counter += 1 if i == "X" || i == "O"
    end
    counter
  end
  
  def current_player
    count = turn_count()
    (count % 2).zero? ? "X" : "O"
  end
  
  def full?
    @board.all? { |i| i == 'X' || i == 'O' }
  end
  
  def draw?
    !won?() && full?()
  end
  
  def over?
    return false unless won?() || draw?() || full?()
    true
  end
  
  def winner
    winner = won?()
    return @board[winner[0]] if winner.is_a?(Array)
  end
  
  def won?
    return false if (0..8).none?{ |i| position_taken?(i.to_i) }
  
    WIN_COMBINATIONS.each do |i|
      win_index_1 = i[0].to_i
      win_index_2 = i[1].to_i
      win_index_3 = i[2].to_i
      position_1  = @board[win_index_1]
      position_2  = @board[win_index_2]
      position_3  = @board[win_index_3]
  
      return i if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return i if position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
    end
    false
  end

  def play
    turn() while over?() == false
    if won?() != false
      puts "Congratulations #{winner()}!"
    elsif draw?() == true
      puts "Cat's Game!"
    end
  end
end
