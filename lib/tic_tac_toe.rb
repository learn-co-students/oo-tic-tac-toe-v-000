class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def input_to_index(user_input)
    num = user_input.to_i
    index = num-1
  end

    def move(index, value = "X")
      @board[index] = value
    end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
        return true
      else
        return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index_input = input_to_index(input)
    until valid_move?(index_input) === true
      puts "Please enter 1-9:"
      input = gets
      index_input = input_to_index(input)
    end
    move(index_input, current_player)
    display_board
  end

  def won?
    winning_combo = false
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    else
      WIN_COMBINATIONS.each do |wins|
        #wins = first thing in WIN_C
        #wins = 2nd thing in WIN_C
        char1 = "X"
        char2 = "O"
          if @board[wins[0]] == char1 && @board[wins[1]] == char1 && @board[wins[2]] == char1 || @board[wins[0]] == char2 && @board[wins[1]] ==char2 && @board[wins[2]] == char2
            winning_combo = wins
        end
      end
      winning_combo
    end
  end

  def full?
    @board.none?{|spaces| spaces == " "}
  end


  def draw?
    if full? == true && won? == false
      return true
    end
  end

  def over?
    if won?  != false
      return true
    elsif draw? == true
      return true
    elsif full? == true
      return true
    else
      return false
    end
  end

  def winner
    won?
    if won? != false
      winner = won?
      @board[winner[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
