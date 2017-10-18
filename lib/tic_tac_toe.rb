class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
    return index
  end

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken? (index)
    if @board[index] == "X" or @board[index] == "O"
      return true
    end
    false
  end

  def valid_move?(index)
    if index < 0 || index > 8
      return false
    elsif position_taken?(index) == true
      return false
    end
    true
  end

  def turn_count
    turns = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turns +=1
      end
    end
    return turns
  end

  def current_player
    turns = turn_count
    if turns == 0 || turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input=gets.strip
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index) == true
      move(index,player_token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    @board.each do |position|
      if position == " "
        return false
      end
    end
    true
  end

  def draw?
    if full? == true && won? == false
      return true
    end
    false
  end

  def over?
    if won? != false || draw? == true
      return true
    end
    false
  end

  def winner
    win_combination = won?
    if over? == true && draw? == false
      win_index = win_combination[0]
      letter = @board[win_index]
      return letter
    end
  end

  def play
    until over? == true
      turn
    end

    if won? != false
      winner_token = winner
      puts "Congratulations #{winner_token}!"
    else draw? == true
      puts "Cat's Game!"
    end
  end

end
