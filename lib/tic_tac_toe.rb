class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
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
    index = input.to_i - 1
    return index
  end

  def move(index,player="X")
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      pos_1=combo[0]
      pos_2=combo[1]
      pos_3=combo[2]
      if @board[pos_1] == @board[pos_2] && @board[pos_2] == @board[pos_3] && @board[pos_1] != " "
        return combo
      end
    end
    return false
  end

  def full?
    @board.none?{|i| i==" "}
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      combo = won?
      winner = @board[combo[0]]
      return winner
    else
      puts "Whatevs"
      return nil
  end
  end

  def turn_count
    turn_count = 0
    @board.each do |data|
    if data == "X" || data == "O"
        turn_count += 1
      end
    end
    return turn_count
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn(player="X")
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    player = current_player
    if !valid_move?(index)
      turn
    end
    move(index,player)
    display_board
  end


   def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index)
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def move(index,player)
    @board[index] = player
  end

  def play(board= [" "," "," "," "," "," "," "," "," "])
    player= "X"
    turn_count= 0
    while turn_count <9
      if over?
        break
      end
      player = current_player
      count = turn_count
      turn(player)
    end
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
