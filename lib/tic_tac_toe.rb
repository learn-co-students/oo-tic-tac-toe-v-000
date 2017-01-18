class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def input_to_index(input)
    input = input.to_i - 1
  end

  def move(input, value = "X")
    @board[input] = value
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index < 9 && index >= 0 && (@board[index] == " " || @board[index] == nil)
      true
    else
      false
    end
  end

  def turn
    i = false
    until i
      puts "Please enter 1-9:"
      input = gets.strip

      index = input_to_index(input)

      player = current_player

      if valid_move?(index) == true
        move(index, player)
        display_board
        break
      else
        puts "That is not a valid move"
      end
    end
  end

  def turn_count
    x = 0

    @board.each do |moves|
      if moves == "X" || moves == "O"
        x += 1
      end
    end

    x
  end

  def current_player
    x = 0

    @board.each do |moves|
      if moves == "X" || moves == "O"
        x += 1
      end
    end

    if x % 2 == 1
      "O"
    else
      "X"
    end
  end

  def won?
    if @board.all? {|index| index == " "} == true && @board.all? {|index| index == 'X' || index == 'O'} == true
      return false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
          return combo
        end
      end

    end
    return false
  end

  def full?
    if @board.all? {|index| index == 'X' || index == 'O'}
      true
    elsif @board.any? {|index| index == " "}
      false
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    elsif full? == false
      return false
    end
  end

  def over?
    if full? == false
      false
    else
      true
    end
  end

  def winner
    if won? == false
      return nil
    else
      combo = won?
      @board[combo[0]]
    end
  end

  def play
    until over?
      if won?
        puts "Congratulations #{winner}!"
        break
      end
      turn
      if draw?
        break
      end
    end
    puts "Cat's Game!"
  end
  
end