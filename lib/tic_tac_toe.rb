class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  def input_to_index(input)
    index = input.to_i - 1
    return index
  end
  def move(index, token = "X")
    @board[index] = token
  end
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  def valid_move?(index)
    if index >=0 && index <= 8 && !position_taken?(index)
      return true
    else
      return false
    end
  end
  def turn
    puts "Please input a value between 1-9."
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      puts "Invalid input."
      turn
    end
  end
  def turn_count
    turn_count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        turn_count += 1
      end
    end
    return turn_count
  end
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def won?
    win_comb = []
    win_check = 0
    WIN_COMBINATIONS.each do |comb|
      comb1 = comb[0]
      comb2 = comb[1]
      comb3 = comb[2]
      if (@board[comb1] == "X" && @board[comb2] == "X" && @board[comb3] == "X") || (@board[comb1] == "O" && @board[comb2] == "O" && @board[comb3] == "O")
        win_comb = comb
        win_check = 1
      end
    end
    if win_check == 1
      return win_comb
    else
      return false
    end
  end
  def full?
    if turn_count == 9
      return true
    else
      return false
    end
  end
  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end
  def over?
    if draw?|| !!won?
      return true
    else
      return false
    end
  end
  def winner
    if !!won?
      win_comb = won?
      comb1 = win_comb[0]
      return @board[comb1]
    else
      return nil
    end
  end
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
