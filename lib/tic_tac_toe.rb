class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player="X")
    @board[index-1] = current_player
  end

  def position_taken?(location)
    @board[location] == "X" || @board[location] == "O"
  end

  def valid_move?(index)
    i = index.to_i - 1
    i.between?(0,8) && !position_taken?(i)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i
    if valid_move?(input)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |idx|
      if idx == "X" || idx == "O"
        count+=1
      end
    end
    count
  end

  def current_player
    count = turn_count
    if count%2==0
      return "X"
    else 
      return "O"
    end
  end

  def won?
    won = false 
    WIN_COMBINATIONS.each do |combo|
      i0 = @board[combo[0]]
      i1 = @board[combo[1]]
      i2 = @board[combo[2]]
      if (i0=="X" || i0=="O") && i0==i1 && i0==i2
        return combo
      end
    end
    won
  end

  def full?
    @board.all? {|i| !(i.nil? || i == " ")}
  end

  def draw?
    ans = true
    if !(full?)
      ans = false
    end
    if won?
      ans = false
    end
    ans
  end

  def over?
    full? || won?
  end

  def winner
    winner = won?
    if winner 
      return @board[winner[0]]
    else 
      return nil
    end
  end

  def play
    current = "X"
    until over?
      current = current_player
      turn
      if won? || draw?
        break
      end
    end
    w = won?
    if w 
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end




