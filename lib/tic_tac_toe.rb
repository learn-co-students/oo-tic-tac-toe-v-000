class TicTacToe

  $WINNER
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

  WIN_COMBINATIONS =
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]



  def input_to_index(index)
    cell = index.to_i - 1
    return cell
  end

  def move(index, character = "X")
    @board[index] = character

  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

    def valid_move?(pos)
      if pos >= 0 && pos <= 8 && position_taken?(pos) == false
        return true
      else
        return false
      end
    end

    def turn_count
      count = 0
      @board.each do |cell|
        if cell == "X" || cell == "O"
          count = count + 1
        end
      end
      return count
    end

    def current_player
      if turn_count.even?
        return "X"
      elsif turn_count.odd?
        return "O"
      end
    end

    def turn
      puts "Specify a position by entering 1-9"
      input = gets.strip
      position = input_to_index(input)

      if valid_move?(position) == true && draw? != true
        move(position, current_player)
        display_board
      else
        turn
      end

    end

    def won?
      WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
      end
    end

    def full?
      @board.all?{|token| token == "X" || token == "O"}
    end

    def draw?
      full? && !won?
    end

    def over?
      won? || full? || draw?
    end

    def winner
      if winning_combo = won?
        @board[winning_combo.first]
      end
    end

    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
  end
