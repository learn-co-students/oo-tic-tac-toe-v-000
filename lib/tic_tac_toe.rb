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

  def input_to_index(index)
    index.to_i - 1
  end 

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) &&  index.between?(0,8)
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Enter a position 1-9:"
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
    WIN_COMBINATIONS.each do |win|
      windex_1 = win[0]
      windex_2 = win[1]
      windex_3 = win[2]
      pos_1 = @board[windex_1]
      pos_2 = @board[windex_2]
      pos_3 = @board[windex_3]
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
        return win
      elsif (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        return win
      end
    end
    false
  end

  def full?
    if @board.detect {|i| i == " " || i == nil}
      false
    else
      true
    end
  end

  def draw?
    if full? && !won?
      true
    elsif !full? && !won?
      false
    elsif won?
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end
  def winner
    return nil if !won?
    position = won?[0]
      if @board[position] == "X"
        "X"
      elsif @board[position] == "O"
        "O"
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
  end
end
  
  