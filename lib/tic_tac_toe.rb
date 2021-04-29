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

  def move(index, token)
      @board[index] = token
  end

  def  position_taken?(index)
      @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count +=1
    end
    end
    count
  end

  def  current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
   end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combinations|
      if @board [combinations[0]] == "X" && @board[combinations[1]] == "X" && @board[combinations[2]] == "X" || @board[combinations[0]] == "O" && @board[combinations[1]] == "O" && @board[combinations[2]] == "O"
        return combinations
      end
    end
    return  false
  end

  def full?
    @board.all? {|combinations| combinations == "X" || combinations == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if won? == false
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    else
      return "O"
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
