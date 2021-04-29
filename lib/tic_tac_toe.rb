class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    @user_input = user_input
    @user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != "" && @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|token| token == "O" || token == "X"}
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
    WIN_COMBINATIONS.each do |win_combo|
      win1 = win_combo[0]
      win2 = win_combo[1]
      win3 = win_combo[2]

      position1 = @board[win1]
      position2 = @board[win2]
      position3 = @board[win3]

      if position1 == "O" && position2 == "O" && position3 == "O"
        return win_combo
      elsif position1 == "X" && position2 == "X" && position3 == "X"
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? do |full|
      if full == "X" || full == "O"
        true
      end
    end
  end

  def draw?
    @board.all? do |draw|
      if !(won?) && full? == true
        return draw
      end
    end
  end

  def over?
    @board.all? do |over|
      if full? || draw? || won?
        over
      end
    end
  end

  def winner
    combo = won?
    @board[combo[0]] if(combo)
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
