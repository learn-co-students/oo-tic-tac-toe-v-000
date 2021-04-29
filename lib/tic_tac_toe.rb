class TicTacToe

 def initialize(board = nil)
    @board = board || Array.new(9, " ")
 end
 
 p "Welcome to TicTacToe!"
 
 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input + -1
  end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def move(index, current_player)
    @board[index] = current_player
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end


  def turn
    puts "Please enter 1-9:"

    user_input = gets.chomp

    position = input_to_index(user_input)

    if valid_move?(position)
      move(position, current_player)
      display_board
      puts 'Great move!'

    else
      turn
    end
  end

 
  def won?
    WIN_COMBINATIONS.detect do |winning_array|

      win_index_1 = winning_array[0]
      win_index_2 = winning_array[1]
      win_index_3 = winning_array[2]
  
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

    position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    end
  end 


  def full?
    @board.include?("X" && "O") == true
    @board.include?(" ") == false
  end


  def draw?
    !won? && full?
  end


  def over?
    draw? || won?
  end


  def winner
    if won?
    @board[won?[0]]
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
    else 
      puts "Game over."
  end

 end
end