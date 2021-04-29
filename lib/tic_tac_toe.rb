class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    current_player = turn_count % 2 == 0 ? "X" : "O"
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def move (index, token = "X")
    @board[index] = current_player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index)
      display_board
    else
      turn
    end
  end

  def won?
    current = []
    someone_won = false
    WIN_COMBINATIONS.each do |win|
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        someone_won = true
        current = [win_index_1, win_index_2, win_index_3]
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        someone_won = true
        current = [win_index_1, win_index_2, win_index_3]
      else
        false
      end
    end
    if someone_won
      current
    else
      false
    end
  end

  def full?
    if @board.all? {|draw| draw == "X" || draw == "O"}
      true
    else
      false
    end
  end

  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if full? == true || won? != false
      true
    else
      false
    end
  end

  def winner
    if won? == false
      nil
    else
      current = won?
      @board[current[1]]
    end
  end

  def play
    while over? != true && draw? !=true && turn_count < 10
      turn
    end
    if won? != false
        puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
