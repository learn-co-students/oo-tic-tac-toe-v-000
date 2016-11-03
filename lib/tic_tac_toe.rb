class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def input_to_index(input)
    (input.to_i) - 1
  end


  def move(input, token = "X")
    index = input_to_index(input)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(input)
    index = input_to_index(input)
    move = @board[index]
    index > -1 && move != nil && !position_taken?(index)
  end

  def turn
    puts "Enter 1-9: "

    player_move = gets.strip

    if valid_move?(player_move)
      move(player_move, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
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

  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] &&
      @board[i[1]] == @board[i[2]] &&
      position_taken?(i[0])
    end
  end

  def full?
    !@board.detect{|i| i != "X" && i != "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    else
      nil
    end
  end

  # def play
  #   turn
  #   if won?
  #     puts "Congrats #{winner}!"
  #   elsif draw?
  #     puts "Cats Game!"
  #   else
  #     play
  #   end
  # end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
end
