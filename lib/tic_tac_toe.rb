class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Diagonal downward right
    [2,4,6] #Diagonal downward left
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @input = input
    @index = @input.to_i - 1
  end

  def move
    if valid_move?
    @board[@index] = @current_player
    else
      move
    end
  end

  def position_taken?
    @board[@index] != " " && @board[@index] != ""
  end

  def valid_move?
    @index.between?(0,8) && !position_taken?
  end

  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    input_to_index
    @index = input_to_index(@input)
    current_player
    @current_player = current_player
    if valid_move?
      move
      display_board
    else
      turn
    end
  end

  def turn_count(board)
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(board, index)
      !(board[index].nil? || board[index] == " ")
  end

  def won?(board)

      WIN_COMBINATIONS.each do |combination|
        index1 = combination[0]
        index2 = combination[1]
        index3 = combination[2]
        position_1 = board[index1]
        position_2 = board[index2]
        position_3 = board[index3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return combination
        end
      end
      false
  end



  def full?(board)
  # no need to call won?(board)
      if board[0] == " "
        false
      elsif board[1] == " "
        false
      elsif board[2] == " "
        false
      elsif board[3] == " "
        false
      elsif board[4] == " "
        false
      elsif board[5] == " "
        false
      elsif board[6] == " "
        false
      elsif board[7] == " "
        false
      elsif board[8] == " "
        false
  #else shouldn't have condition
      else
        true
      end
  end


  def draw?(board)
    !won?(board) && full?(board)
   end

  def over?(board)
    won?(board)
    draw?(board)
    full?(board)

    if draw?(board)
      return true
    elsif won?(board) && full?(board)
      return true
    elsif won?(board) && !full?(board)
      return true
    else
      return false
    end
  end

  def winner(board)
     won?(board)
     if won?(board)
  #  EX; return WIN_COMBINATIONS[0] = [0,1,2]
      (won?(board)).each do |position|
  #  ([0,1,2]).each do |position|
        board[position]
        if board[position] == "X"
          return "X"
        elsif board[position] == "O"
          return "O"
        end
      end
    else
      nil
    end
  end

  def play(board)
    until over?(board)
      turn(board)
      turn_count(board)
    end
    won?(board)
    if won?(board)
      winner(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end

  end
end
