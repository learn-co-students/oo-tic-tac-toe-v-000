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

  def input_to_index(input)
    return input.to_i-1
  end

  def move(index,char)
    @board[index]=char
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if (combo.all?{|pos| position_taken?(pos)})
        if (combo.all?{|position| @board[position]=="X"})
          return combo
        elsif (combo.all?{|position| @board[position]=="O"})
          return combo
        end
      end
    end
    return false
  end

  def full?
    return !(@board.any?{|pos| pos==" "})
  end

  def draw?
    full? && !won?
  end

  def over?
    (draw? || won?)
  end

  def winner
    if won?
      return @board[won?[0]]
    end
    return nil
  end

  def position_taken?(index)
    return (@board[index] != " ")
  end #def end

  def valid_move?(index)
    return (index.between?(0,8) && !position_taken?(index))
  end #def end

  def turn_count
    @board.count{|token| token == "O" || token == "X"}
  end #def end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end #def end

  def turn
    trig = false;
    while (!trig)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        character = current_player
        move(index, character)
        display_board
        trig=true
      end
    end
  end #method end

  def play
    9.times do
      if !over?
        turn
      end #if end
    end #loop end
    if draw?
      puts "Cat's Game!"
    elsif (winner=="X" || winner=="O")
      puts "Congratulations "+winner+"!"
    end #if end
  end #method end

end #class end
