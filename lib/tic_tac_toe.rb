class TicTacToe

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

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

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

  def move(index,current_player)

    @board[index] = current_player
    current_player = "X" || current_player = "O"

  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
      count = 0
      @board.each do |move|
        if move == "X" || move == "O"
          count += 1
        end
      end
      count
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
    end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip

      index = input_to_index(user_input) # input_to_index("1") => 0
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        # recursion
        turn
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |winning_index|
        # check if there is a token at this position, and then check
        # if every other position is the same
        if position_taken?(winning_index[0]) && @board[winning_index[0]] == @board[winning_index[1]] && @board[winning_index [1]] == @board[winning_index[2]]
          return winning_index
        end
      end
      return false
    end

    def full?
    @board.all? do |mark|

    if mark == "X" || mark == "O"
      true
    end
    end
    end

    def draw?
    if full? && !won?

      true
    end
    end
    def over?
      if draw? || won?
        true
      end
    end

    def winner

      if won?
        return @board[won?[0]]
      end
    end

    def play
      until over?
        turn
      end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    if !winner
    puts "Cat's Game!"
    end


end
end
