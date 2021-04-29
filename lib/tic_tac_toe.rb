class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
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

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      true
    end
  end

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

  def turn_count
    number_of_turns = 0
    @board.each do |board_space|
      if board_space == "X" || board_space == "O"
        number_of_turns += 1
      end
    end
    return number_of_turns
  end

  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if win_array.all? { |win_index| position_taken?(win_index) }
        win_index_1 = win_array[0]
        win_index_2 = win_array[1]
        win_index_3 = win_array[2]

        if @board[win_index_1] == @board[win_index_2] && @board[win_index_1] == @board[win_index_3]
          return win_array
        end
      end
    end
    return false
  end

  def full?
    if @board.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if full?
      if won?
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      array = won?
      index = array[0]
      winner = @board[index]
      return winner
    end
  end

  def play
    until over?
      turn
    end

    if won?
      game_winner = winner
      puts "Congratulations #{game_winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
