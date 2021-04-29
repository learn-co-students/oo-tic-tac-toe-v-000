class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    if index.between?(0,8)
      !position_taken?(index)
    end
  end

  def turn
    display_board
    puts "Enter number 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      counter += 1 if position == "X" || position == "O"
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return combo
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      end
    end
    false
  end

  def full?
    !@board.any?{|position| position == " "}
  end

  def draw?
    if full?
      if won?
        return false
      else
        return true
      end
    end
    false
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    while !over? do
      display_board
      turn
      # puts "count: #{counter} "
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
