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
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = 'X')
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    taken_spaces = 0

    @board.each do |space|
      if "X" == space || "O" == space
        taken_spaces += 1
      end
    end

    return taken_spaces
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      all_x = win_combination.all? do |index|
        'X' == @board[index]
      end
      all_y = win_combination.all? do |index|
        'O' == @board[index]
      end
      if all_x or all_y
        return win_combination
      end
    end

    false
  end

  def full?
    @board.all?{ |slot| 'X' == slot or 'O' == slot }
  end

  def draw?
    (!won? and full?) ? true : false
  end

  def over?
    (won? or draw?) ? true : false
  end

  def winner
    (win_combination = won?) ? @board[win_combination[0]] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
