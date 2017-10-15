class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  end

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

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    count = 0
    @board.each do |b|
      if b != (" " || "")
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    result = ""
    win_result = []
    WIN_COMBINATIONS.each do |win|
      if (@board[win[0]] == @board[win[1]] &&  @board[win[0]] == @board[win[2]] && @board[win[0]] == "X") ||
         (@board[win[0]] == @board[win[1]] &&  @board[win[0]] == @board[win[2]] && @board[win[0]] == "O")
        win_result << win[0]
        win_result << win[1]
        win_result << win[2]
      end
      result = win_result
    end
    result == [] ? false : result
  end

  def full?
    @board.none? { |b| b == ( " " || "" ) }
  end

  # def empty?
  #   @board.all? { |b| b == ( " " || "" ) }
  # end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if result = won?
      winner = @board[result[0]]
    end
    winner
  end

  def play
    while !over?
      turn
    end
    if over?
      if winner
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end
end
