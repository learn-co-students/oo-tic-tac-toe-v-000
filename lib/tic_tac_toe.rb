class TicTacToe
  def initialize(board = nil)
    #you set the default arg for board to nil so that it's empty
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
    puts " #{@board[0]} " + '|' + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + '|' + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + '|' + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(index)
    return index.to_i - 1
  end

  def move(index, symbol)
    @board[index] = symbol
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|token| token == "X" || token =="O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all? {|element| element != " "}
  end

  def draw?
    if !(won?) && full?
      return true
    end
  end

  def over?
    if won?|| draw?
      return true
    end
  end

  def winner
    #because they inherit from each other, you can use combo
    if combo = won?
      @board[combo[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      symbol = current_player
      move(index, symbol)
    else
      turn
    end
    display_board
  end

  def play
    until over? do
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
