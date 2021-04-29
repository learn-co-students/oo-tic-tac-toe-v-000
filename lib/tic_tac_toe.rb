class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    index
  end

  def move(index, current_player)
      @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if ((position_taken?(index)) != (index.between?(0, 8)))
      true
    else ((index.between?(0, 8)) == (position_taken?(index)))
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      current_player = "X"
    else turn_count.odd?
      current_player = "O"
    end
  end

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "invalid move"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find { |win_combination| @board[win_combination[0]] == @board[win_combination[1]] &&  @board[win_combination[1]] == @board[win_combination[2]] && @board[win_combination[0]] != " "}
  end

  def full?
    @board.none? {|token| token == " "}
  end

  def draw?
    if won?
    else full?
    end
  end

  def over?
    @board.all? {draw? || won?}
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    puts "Please enter 1-9:"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      display_board
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
