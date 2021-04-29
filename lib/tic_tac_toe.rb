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
    [6,4,2]
  ]

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

  def move(position, player_token = "X")
    @board[position] = player_token
    end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] =- "O"
      true
    end
  end

  def valid_move?(index)
   if !position_taken?(index) && index.between?(0,8)
      return true
   end
  end

  def turn
    puts "Please enter 1-9:"
    users_input=gets.strip
    index = input_to_index(users_input)
    if valid_move?(index)

      move(index, current_player)

      display_board
    else turn
    end
  end

  def turn_count
    counter = 0
    @board.count do |count|
      if count != " "
        counter+=1
      end
    end
  end

  def current_player
    if turn_count % 2 == 0
     "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      position_1 == position_2 && position_2 == position_3 && position_taken?(win_combination[0])
      end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
     if full? && !won?
       true
     end
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

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
