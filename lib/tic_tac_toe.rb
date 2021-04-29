require 'pry'
class TicTacToe
  def initialize(board=Array.new(9," "))
    @board=board
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def turn_count()
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

    def input_to_index(user_input)
      index = user_input.to_i - 1
      return index
    end

    def move(index, token="X")
      @board[index] = token
    end

    def position_taken?(index)
      if @board[index] == "X" || @board[index] == "O"
        return TRUE
      else
        return FALSE
      end
    end

    def valid_move?(position)
      if position.between?(0,8)
        if position_taken?(position)
          return FALSE
        else
          return TRUE
        end
      else
        return FALSE
      end
    end

    def turn()
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      player = current_player()
      if valid_move?(index) == true
        move(index, player)
        display_board()
      else
        turn()
      end
    end

    def won?()
      WIN_COMBINATIONS.each do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return wincombo
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return wincombo
      else

      end
    end
    return false
  end

  def full?()
    full_board = @board.none? do |index|
      index == " "
    end
    return full_board
  end

  def draw?()
    if won?() != false
      return false
    elsif full?() == true
      return true
    else
      return false
    end
  end

  def over?()
    if won?() != false
      return true
    elsif draw?() == true
      return true
    else
      return false
    end
  end

  def winner()
    WIN_COMBINATIONS.each do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return "X"
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return "O"
      else

      end
    end
    return nil
  end

  def play()
    until over?() == true do
      turn()
    end
    if won?() != false
        winning_player = winner()
        puts "Congratulations #{winning_player}!"
      elsif draw?() == true
        puts "Cat's Game!"
      end
  end

end
