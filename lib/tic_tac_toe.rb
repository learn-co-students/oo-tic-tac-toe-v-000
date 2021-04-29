class TicTacToe

  def initialize
      @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
       if @board[index] == "X" || @board[index] == "O"
       true
      end
    end

  def position_taken?(index)
    if @board[index] != " " && @board[index] != ""
      true
      else
        false
    end
  end

  def valid_move?(index)
    if index.between?(0, 8)
      if @board[index] == " " || @board[index] == ""
        true
      end
    end
  end

  def turn
    puts "please makes valid moves"
    input = gets.strip
    position = input_to_index(input)
      if valid_move?(position)
        player = current_player
        move(position, player)
        display_board
      else
      turn
      end
  end

  def turn_count
    count = 0
      @board.each do|index|
        if index == "X" || index == "O"
        count += 1
        end
      end
    count
  end


  def current_player
    count = turn_count
      if count.even?
        "X"
      else
        "O"
      end
    end

  def won?
    WIN_COMBINATIONS.detect do|combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]
      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
     if !won? && full?
       true
     end
  end

  def over?
    draw? || won? || full?
  end

  def winner
    if won?
      win_index = won?[0]
      @board[win_index]
    end
  end

  def play
    until over?
      turn
    end
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
       puts "Cat\'s Game!"
    end
  end

end
