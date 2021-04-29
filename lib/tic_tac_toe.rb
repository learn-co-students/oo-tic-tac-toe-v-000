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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n"
    puts "-----------\n"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} \n"
    puts "-----------\n"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i-1
    return index
  end

  def move(index,token="X")
    @board[index]=token
  end

  def position_taken?(index)
    if @board[index]!=" "
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    end
  end

  def turn
    puts "Please enter a number between 1-9"
    input=gets.strip
    index=input_to_index(input)
    if current_player == "X"
      token = "X"
    elsif current_player == "O"
      token = "O"
    end
    if valid_move?(index)
      move(index,token)
      display_board
    else
      puts "What?!?!? That's not a number between 1 and 9 at all!! Get yourself together, man!"
      turn
    end
  end

  def turn_count
    counter=0
    @board.each do |board_loop|
      if board_loop != " "
        counter+=1
      end
    end
    return counter
  end

  def current_player
    if turn_count%2==0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) &&\
        @board[combo[0]]==@board[combo[1]] &&\
        @board[combo[1]]==@board[combo[2]]
        return combo
      end
    end
    nil
  end

  def full?
    if @board.none?{|spaces|spaces==" "}
      return true
    end
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
  end

  def winner
    if won?
      combo = won?
      winner = combo[0]
      return @board[winner]
    end
  end

  def play
    until over?
      turn
    end
    puts "Congratulations #{winner}!"
    if draw?
      puts "Cat's Game!"
    end
  end

end
