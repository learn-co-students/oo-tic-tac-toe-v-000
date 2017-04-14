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
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i-1
  end

  def move(index,player="X")
    @board[index] = player
  end

  def position_taken?(index)
    if(@board[index] == "X" || @board[index] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if(position_taken?(index) || index < 0 || index > 8)
      return false
    else
      return true
    end
  end

  def turn
    puts "Enter a move between 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count do |space|
      space == "X" || space == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|space| @board[space] == "X"}
        return combo
      elsif combo.all?{|space| @board[space] == "O"}
        return combo
      end
    end
    return nil
  end

  def full?
    @board.all?{|space| space=="X" || space=="O"}
  end

  def draw?
    won = won?
    full = full?

    if(full && !won)
      return true
    elsif (won)
      return false
    elsif (!full && !won)
      return false
    end
  end

  def over?
    draw? || won? || full?
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
    else
      puts "Cat's Game!"
    end
  end


end
