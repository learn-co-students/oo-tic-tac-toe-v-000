WIN_COMBINATIONS =
[[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]
class TicTacToe
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
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
  def move(user_input, player = "X")
   @board[user_input] = player
  end
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
       move(index, current_player)
       display_board
    else turn
    end
  end
  def turn_count
  counter = 0
  @board.each do | current_player |
    if current_player == "X" || current_player == "O"
       counter += 1
      end
    end
     counter
  end
  def current_player
    if turn_count % 2 != 0 then current_player = "O"
    else current_player = "X"
    end
  end
  def won?
     WIN_COMBINATIONS.find do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end
  def full?
    @board.all? {|space| space != " "}
   end
   def draw?
    won? == nil && full?  == true
   end
   def over?
    won? || draw?
   end
   def winner
     if won? != nil
     winner = @board[won?[0]]
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
