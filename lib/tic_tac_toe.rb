class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(pos)
    pos.to_i - 1
  end

  def move(idx, char)
    @board[idx] = char.strip
  end

  def position_taken?(idx)
    @board[idx] == "X" || @board[idx] == "O" ? true : false
  end

  def valid_move?(idx)
    !position_taken?(idx) &&  0 <= idx && idx <= 8 ? true : false
  end

  def turn_count
    count = 0
    @board.each_with_index do |el,i|
      if position_taken?(i)
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    pos = gets.strip
    idx = input_to_index(pos)
    if valid_move?(idx)
      move(idx, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|idx| board_x.include?(idx)} || combo.all? {|idx| board_o.include?(idx)}
    end
  end

  def winner
  won? ?  @board[won?[0]] : nil
  end

  def full?
    @board.all? {|el| el == "X" || el == "O"} && !won?
  end

  def draw?
     full? && !won?
  end

  def over?
    draw? || won?
  end
  def board_x
    board_x_arr = []
    @board.each_with_index do |el, idx|
      if el == "X"
        board_x_arr << idx
      end
    end
    board_x_arr
  end

  def board_o
    board_o_arr = []
    @board.each_with_index do |el, idx|
      if el == "O"
        board_o_arr << idx
      end
    end
    board_o_arr
  end


end
