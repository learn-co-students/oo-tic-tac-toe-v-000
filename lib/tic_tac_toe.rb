class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize()
    @board = Array.new(9," ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, mark)
    @board[index] = mark
  end

  def position_taken? (index)
    @board[index] != " "
  end

  def valid_move? (index)
    index.between?(0,8)  && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    index = input_to_index(gets)
    if !valid_move?(index)
      turn()
    end
    move(index, current_player())
    display_board()
  end

  def turn_count()
    count = 0
    @board.each { |val|
      if val!=" "
        count+=1
      end
    }
    count
  end

  def current_player()
    turn_count()%2 == 0 ? "X" : "O"
  end

  def won? ()
    WIN_COMBINATIONS.find do | combo |
      position_taken?(combo[0]) && @board[combo[0]]==@board[combo[1]] && @board[combo[1]]==@board[combo[2]]
    end
  end

  def full?()
    (0..8).all? { | idx | position_taken?(idx)}
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    won?() || draw?() || full?()
  end

  def winner ()
    combo = won?()
    return combo==nil ? nil : @board[combo[0]]
  end

  def play()
    while !over?() do
      turn()
    end
    if winner()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end
