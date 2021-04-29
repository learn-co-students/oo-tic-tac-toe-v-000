class TicTacToe
  def initialize
    @board =  [" "," "," "," "," "," "," "," "," "]
  end

  def board=
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    # ETC, an array for each win combination
    [6,7,8], # bottom row
    [0,3,6], #left column
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

  def move(num, character)
    @board[num] = character
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        @counter += 1
      end
    end
    return @counter
  end

  def current_player
      @counter = turn_count
      @counter % 2 == 0 ? "X" : "O" 
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character = current_player)
      display_board
    else
      turn
    end
  end

  def won?
      WIN_COMBINATIONS.detect do |combo|

      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

     if (position_1 == "X" && position_2 == "X" && position_3 == "X")
       return combo
     elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
       return combo
     end
   end
   return nil
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end  

  def over?
    if full? || won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end


end