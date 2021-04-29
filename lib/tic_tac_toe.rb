class TicTacToe
  #initialize
  def initialize
    @board = [" ", " ", " "," ", " ", " ", " ", " ", " "]
  end
  #WIN COMBINATIONS
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  #display board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #input to index
  def input_to_index(input)
    index = (input.to_i - 1)
  end
  #move
  def move(index, player)
    @board[index] = player
    return @board
  end
  #position taken
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  #valid move
  def valid_move?(index)
    if position_taken?(index)
      return false
    elsif !index.between?(0, 8)
      return false
    else
      return true
    end
  end
  #turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  #turn count
  def turn_count
    num_turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        num_turns += 1
      end
    end
    return num_turns
  end
  #current player
  def current_player
    return turn_count() % 2 == 0 ? "X" : "O"
  end
  #won
  def won?
    if !@board.include?("X") && !@board.include?("O")
      return false
    elsif
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
    else
      return false
    end
  end
  #full
  def full?
    !@board.include?(" ") ? true : false
  end
  #draw
  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end
  #over
  def over?
    full? || won? || draw? ? true : false
  end
  #winner
  def winner
    winning_combo = won?
    if winning_combo
      @board[winning_combo.first]
    end
  end
  #play
  def play
    until over?
      turn
    end
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
