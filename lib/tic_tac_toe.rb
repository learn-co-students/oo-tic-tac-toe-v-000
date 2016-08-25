class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character = "X")
    @board[input_to_index(index)] = character
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(input_to_index(index)) == true
      false
    elsif input_to_index(index) > 8
      false
    elsif input_to_index(index) < 0
      false
    else
      true
    end
  end

  def turn
    loop do
      puts "Please enter 1-9:"
      input = gets.strip
      index = input

        if valid_move?(index) == true
            move(index, current_player)
            display_board
          break
        end
      end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
      WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        else
          false
        end
      end

      if @board.include?("X" || "O") == false
        false
      end
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    x_count = @board.select{|i| i == "X"}
    o_count = @board.select{|i| i == "O"}
    if x_count.length > o_count.length
      "X"
    elsif o_count.length > x_count.length
      "O"
    else
      nil
    end
  end

  def play
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
