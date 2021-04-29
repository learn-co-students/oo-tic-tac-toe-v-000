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
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, character)
    index = input_to_index(index)
    @board[index] = character
    return @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == nil || @board[index] == ""
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    index = input_to_index(index)
    if position_taken?(index) == false
      if index >= 0 && index <= 8
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = user_input
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    occupied = 0
    @board.each do |position|
      if position != "" && position != " " && position != nil
        occupied +=1
      end
    end
    return occupied
  end


  def current_player
    x_count = 0
    o_count = 0
    @board.each do |position|
      if position == "X"
        x_count += 1
      elsif position == "O"
        o_count += 1
      end
    end
    if x_count == o_count || x_count == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    winning_array = []
    WIN_COMBINATIONS.detect do |win_combinations|
      @board[win_combinations[0]] == @board[win_combinations[1]] && @board[win_combinations[1]] == @board[win_combinations[2]] && position_taken?(win_combinations[0])
    end
  end

  def full?
    @board.all? {|a| a != " "}
  end

  def draw?
    full_status = full?
    won_status = won?
    if full_status == true && !won_status
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true or won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      winning_array = won?
      winning_index = winning_array[0]
      if @board[winning_index] == "X"
        return "X"
      else
        return "O"
      end
    else
      return nil
    end
  end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
