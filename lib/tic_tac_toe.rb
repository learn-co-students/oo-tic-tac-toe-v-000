class TicTacToe



  WIN_COMBINATIONS=
  [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]


  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value = current_player)
    @board[index] = value
  end

  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
  new_arr = []
  WIN_COMBINATIONS.each do |array|

      win_index_1 = array[0]
      win_index_2 = array[1]
      win_index_3 = array[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        new_arr.push(array[0])
        new_arr.push(array[1])
        new_arr.push(array[2])
        return new_arr
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        new_arr.push(array[0])
        new_arr.push(array[1])
        new_arr.push(array[2])
        return new_arr

      end
    end
      false
  end

  def full?
    @board.none?{|i| i == " "}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    won? || full? || draw?
  end

  def winner
  won?
    WIN_COMBINATIONS.each do |array|

        win_index_1 = array[0]
        win_index_2 = array[1]
        win_index_3 = array[2]
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return "X"
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"

        end
      end
        nil
    end

    def play
      while !over? do
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
    end

end
