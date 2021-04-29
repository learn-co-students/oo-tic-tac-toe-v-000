class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index, position)
    @board[index] = position
  end

  def valid_move?(index)
    if index > (@board.length - 1) || index < 0
      return false
    elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    puts index
    @index = index
    if valid_move?(@index)
        position = current_player()
        move(@index, position)
        display_board()
    else
      turn()
    end

  end

  def turn_count
    turns = 0
    @board.each do |turn|
        if turn == "X" || turn == "O"
          turns += 1
        end
      end
      turns
  end

  def current_player
    turns = turn_count()
    if turns == 0 || turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def play
    counter = 0
    display_board()
    while counter < 9
      if over?()
        if draw?()
          puts "Cat's Game!"
          counter = 10
        else won?() != false
          puts "Congratulations #{winner()}!"
          counter = 10
        end
      else
        turn()
        counter += 1
      end
    end
  end

  # Define your WIN_COMBINATIONS const
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

  def won?
    if(!@board.include?("O") && !@board.include?("X"))
      return false
    else
      WIN_COMBINATIONS.each do |win_combo|
        if (@board[win_combo[0]] == "X") && (@board[win_combo[1]] == "X") && (@board[win_combo[2]] == "X")
          return win_combo
        elsif ((@board[win_combo[0]] == "O") && (@board[win_combo[1]] == "O") && (@board[win_combo[2]] == "O"))
          return win_combo
        end
      end
    end
    return false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if full?() && (won?() == false)
      true
    else
      false
    end
  end

  def over?
    if (won?() != false || draw?())
      true
    else
      false
    end
  end

  def winner
    win_combo = won?()
    if win_combo == false
      return nil
    elsif @board[win_combo[0]] == "X"
      "X"
    elsif @board[win_combo[0]] == "O"
      "O"
    end
  end

end
