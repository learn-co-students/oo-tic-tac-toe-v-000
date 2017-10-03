class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  #horizontal
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #vertical
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonal
  [0,4,8],
  [2,4,6]
]

  def play
    if won?
      winner
    elsif draw?
      puts "Cat's Game!"
    end

    while !over?
      turn
      if won?
        winner
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end

  def turn_count
    turns = 0
    @board.each do |item|
      if item != "" && item != " " && item != nil
        turns += 1
      end
    end
    return turns
  end

  def current_player
    value = turn_count
    value.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      return true
    else
      return false
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    user_input = input.to_i
    return user_input - 1
  end

  def move(index, char="X")
    @board[index] = char
    display_board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      pos_1 = @board[win[0]]
      pos_2 = @board[win[1]]
      pos_3 = @board[win[2]]
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        return win
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        return win
      end
    end
    return false
  end

  def full?
    return @board.all? { |item|
      item == "X" || item == "O"
    }
  end

  def draw?
    if won? != false
      return false
    elsif full?
      return true
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      win_i = Array(won?)

      if @board[win_i[0]] == "X" && @board[win_i[1]] == "X" && @board[win_i[2]] == "X"
        puts "Congratulations X!"
        return "X"
      elsif @board[win_i[0]] == "O" && @board[win_i[1]] == "O" && @board[win_i[2]] == "O"
        puts "Congratulations O!"
        return "O"
      else
        return nil
      end
    end
  end

end #end_class
