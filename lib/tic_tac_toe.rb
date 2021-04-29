class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      turns = 0
      @board.each do |token|
        if token == "X" || token == "O"
          turns += 1
        end
      end
      turns
    end

    def current_player
      if turn_count % 2 == 0
        "X"
      else
        "O"
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |possibility|
        @board[possibility[0]] == @board[possibility[1]] &&
        @board[possibility[1]] == @board[possibility[2]] &&
        position_taken?(possibility[0])
      end
    end

    def full?
      @board.all? do |token|
        token == "X" || token == "O"
      end
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw? || full?
    end

    def winner
      winning_token = won?
      won? && @board[winning_token[0]]
    end

    #Play Method#
    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end
