class TicTacToe
  def initialize(board = nil)
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
    return index
  end

  def move(position, player = "X")
    @board[position] = player
  end

  def turn
    puts "Please provide a move between 1-9?"
    player_choice = gets.chomp
    index = input_to_index(player_choice)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?(index)
    if index < @board.length && index >= 0
      return !position_taken?(index)
    else
      false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def full?
    @board.all? {|ele| ele == "X" || ele == "O"}
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
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
    if won?
      index = won?[0]
      return @board[index]
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|

      position1 = @board[array[0]]
      position2 = @board[array[1]]
      position3 = @board[array[2]]

      if position1 == "X" && position2 == "X" && position3 == "X"
        return array[0..2]
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return array[0..2]
      end
    end
    return false
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
