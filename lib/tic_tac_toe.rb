class TicTacToe

  #Constants
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  #Initalization
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(n)
    return n.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip()
    if(!move(input_to_index(input)))
      turn
    end
    display_board()
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if(@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if((index > -1 && index < 9) && !position_taken?(index))
      return true
    end
  end

  def turn_count
    i = 0
    @board.each do |space|
      if(space != " ")
        i += 1
      end
    end
    return i
  end

  def current_player
    turns = turn_count()
    turns % 2 == 0 ? (return "X") : (return "O")
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if(position_taken?(combo[0]) && (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]))
        return combo
      end
    end
    return false
  end

  def full?
    return !(@board.include? " ")
  end

  def draw?
    return (full?() && !won?())
  end

  def over?
    return (draw?() || won?())
  end

  def winner
    if(over?() && won?())
      return @board[won?()[0]]
    end
  end

  def play
    while(!over?()) do
      turn()
    end
    if(draw?())
     puts "Cat's Game!"
    else
      puts "Congratulations #{winner()}!"
    end
  end

end
