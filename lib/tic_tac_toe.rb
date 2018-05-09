class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i) - 1
  end

  def move(index, value)
    @board[index] = value
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    elsif @board[index] == "X" || @board[index] == "O"
      return true
    end
  end

  def valid_move?(index)   #is the index even within the board?
    if index < 0 || index > 8
      return false
    else
      return !(position_taken?(index)) #checks to see if position is occupied
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    value = current_player

    if valid_move?(index)
      move(index, value)
      display_board
      return @board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    current_player = turn_count % 2 == 0 ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|index| position_taken?(index)}

        first_value = @board[combo[0]]
        second_value = @board[combo[1]]
        third_value = @board[combo[2]]

        if first_value == second_value && first_value == third_value
          return combo
        end
      end
    end
    return false
  end

  def full?
    @board.all?{|element| !(element == " ")}
  end

  def draw?
    if full? && !(won?)
      return true
    end
  end

  def over?
    if draw?
      return true
    end

    if won?
      return true
    end
  end

  def winner
    if over?
      winning_positions = won?
      value = @board[winning_positions[0]]
      if value.include?('X')
        return 'X'
      elsif value.include?('O')
        return 'O'
      else
        return nil
      end
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
