class TicTacToe

  def initialize (board = nil)
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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = 'X')
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == "" || @board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn_count
    9 - @board.count(" ")
  end

  def current_player
    if turn_count.even?
      current_player = "X"
    else
      current_player = "O"
    end
    return current_player
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0] # assign variable to index_0
      win_index_2 = win_combo[1] # assign variable to index_1
      win_index_3 = win_combo[2] # assign variable to index_2

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo #
      end
    end
    return false
  end

  def full?
    @board.all? { |board_occupied| board_occupied != " " }
  end

  def draw?
    !(won?) && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
