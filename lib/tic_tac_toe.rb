class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(player_position, current_player = "X")
      @board[player_position] = current_player
  end

  def position_taken?(player_position)
    @board[player_position] != " " && @board[player_position] != ""
  end

  def valid_move?(player_position)
    player_position.between?(0,8) && !position_taken?(player_position)
  end

  def turn_count
  counter = 0
  @board.each do | placed_on_board |
    if placed_on_board == "X" || placed_on_board == "O"
      counter += 1
    end
  end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    player_position = input_to_index(user_input)
    if valid_move?(player_position)
      move(player_position, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  #binding.pry

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
  @board.all? do | check_for_draw |
    check_for_draw == "X" || check_for_draw == "O"
  end
end

def draw?
  !(won?) && full?
end

def over?
  draw? || won?
end

def winner
  if win_combo = won?
    board_index = win_combo[0]
    postion_on_board = @board[board_index]
    return postion_on_board
  end
end

  def play
    while !(over?)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
