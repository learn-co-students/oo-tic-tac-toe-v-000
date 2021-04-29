class TicTacToe
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

  def input_to_index(input)
    return(input.to_i - 1)
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
         true
      else

         false
      end
  end

  def turn
    cp = current_player
    puts "Player #{cp}, please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      puts "Invalid move.  Try again."
      turn
    end
  end


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8], #diagonal
    [6,4,2], #diagonal
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def won?

      WIN_COMBINATIONS.each do |win_combination|
        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
          if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
            return win_combination
          end
        end
  false
  end

  def full?
    if turn_count == 9
      return true
    else
      false
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return  nil
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

puts "The Game Has Ended."
end



end
