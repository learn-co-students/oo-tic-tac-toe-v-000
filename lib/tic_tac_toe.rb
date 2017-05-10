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
    [2,4,6],
    [0,4,8]
  ]

  def display_board()
    print " #{@board[0]} |"
    print " #{@board[1]} |"
    puts " #{@board[2]} "
    puts "-----------"
    print " #{@board[3]} |"
    print " #{@board[4]} |"
    puts " #{@board[5]} "
    puts "-----------"
    print " #{@board[6]} |"
    print " #{@board[7]} |"
    puts " #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    return !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && !(position_taken?(index))
      return true
    else
      return false
    end
  end

  def turn_count()
    count = 0
    @board.each do |i|
      if (i == "X" || i == "O")
        count += 1
      end
    end
    return count
  end

  def current_player()
    count = turn_count()
    if count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
    WIN_COMBINATIONS.each do |comb|
      if @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X"
        return comb
      end
      if @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"
        return comb
      end
    end
    return false
  end

  def full?()
    @board.each do |index|
      if index != "X" && index != "O"
        return false
      end
    end
    return true
  end

  def draw?()
    if !(won?()) && full?()
      return true
    else
      return false
    end
  end

  def over?()
    if won?() || draw?()
      return true
    else
      return false
    end
  end

  def winner()
    if won?()
      return @board[won?()[0]]
    else
      return nil
    end
  end

  def play()
    while !(over?())
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
end
