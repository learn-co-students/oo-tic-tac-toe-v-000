class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
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

  #display_board

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #input_to_index

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  #move

  def move(index,player_token)
    @board[index] = player_token
  end

  #position_taken?

  def position_taken?(index)
    !(@board[index] == " ") && !(@board[index] == "")
  end

  #valid_move?

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  #turn

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until index.between?(0,8) && valid_move?(index)
      puts "invalid"
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
    player_token = current_player
    move(index,player_token)
    display_board
  end

  #turn_count

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  #current_player

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  #won

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        true
        return combo
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        true
        return combo
      end
    end
    false
  end

  #full?

  def full?
    @board.each do |i|
      if (i != "X") && (i != "O")
        return false
      end
    end
    true
  end

  #draw?

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  #over?

  def over?
    if won?
      return true
    elsif draw?
      return true
    elsif full?
      true
    end
  end

  #winner

  def winner
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O"
    end
  end
  nil
end

  #play

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner()}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
