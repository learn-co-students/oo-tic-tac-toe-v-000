class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end



  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end


  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, character)
    index = input_to_index(index)
    @board[index] = character
    @board
  end

  def position_taken?(index)
    if !(@board[index].nil? || @board[index] == " ")
      true
    else
      false
    end
  end



  def valid_move?(index)
    index = input_to_index(index)
    if !position_taken?(index) && index.between?(0, 8)
      true
    else
      nil
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end


  def turn_count
    counter = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6]
  ]

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? {|index| @board[index] == "X" }
        return win_combination
      elsif win_combination.all? {|index| @board[index] == "O" }
        return win_combination
      end
    end
  end

  def full?
    if @board.any? { |space| space == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if won?
      return false
    elsif !full?
      return false
    else
      return true
    end
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    else
      return false
    end
  end

  def winner
    WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? {|index| @board[index] == "X" }
        return "X"
      elsif win_combination.all? {|index| @board[index] == "O" }
        return "O"
      end
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    until over?
        token = current_player
        if token == "X"
          turn
        elsif token == "O"
          turn
        end
      end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
