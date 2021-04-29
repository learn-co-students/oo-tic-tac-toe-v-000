class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8 ],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token)
    @board[location.to_i-1] = token
    token = "X" || "Y"
  end

  def position_taken?(location)
    if @board[location] != " " || nil
      true
    else
      false
    end
  end

  def valid_move?(location)
    if location.to_i.between?(1,9) && !position_taken?(location.to_i-1)
      true
    else
      false
    end
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    location = gets.strip
    if valid_move?(location)
      move(location, current_player)
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def  current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_move|
      location_1 = @board[winning_move[0]]
      location_2 = @board[winning_move[1]]
      location_3 = @board[winning_move[2]]
      if (location_1 == "X" && location_2 == "X" && location_3 == "X") || (location_1 == 'O' && location_2 == 'O' && location_3 == 'O')
  return winning_move
    else
      false
    end
    end
    nil
  end

  def full?
    @board.all? do |full_board|
      full_board == "X" || full_board == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    winner = won?
    if winner
      @board[winner.first]
    end
  end

  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
  end

end
