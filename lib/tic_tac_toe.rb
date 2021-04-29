
class TicTacToe
    
    def initialize 
      @board = Array.new(9, " ")
    end

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
    user_input.to_i - 1 
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
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
    else 
     turn
    end
    display_board
  end

  def turn_count
    count = 0 
    @board.each do |index|
      if index == "X" || index == "O"
        count += 1 
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] && position_taken?(win_combo[1])
    end
  end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end

  def draw? 
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[1]]
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

