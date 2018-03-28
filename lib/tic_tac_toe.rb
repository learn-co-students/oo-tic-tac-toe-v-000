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

  def input_to_index(input)
    return (input.to_i - 1)
  end
  
  def move(idx, token = "X")
    v = valid_move?(idx)
    
    if v
      @board[idx] = token
      return v
    end
    
    v
  end
  def valid_move?(idx)
    if !idx.between?(0, 8)
      return false
    end
    
    !position_taken?(idx)
  end
  
  def position_taken?(idx)
    chr = @board[idx].strip
    !(chr == "")
  end
  def turn()
    
    puts "Please enter a move: 1-9"
    rtn = gets.strip
    idx = input_to_index(rtn)
    token = current_player()
    
    if !move(idx, token) 
      turn()
    end
    
    display_board()
    true
  end
  def current_player()
    count = turn_count()
    
    if count.even?
      return "X"
    else
      return "O"
    end
  end
  def turn_count()
    count = 0
    @board.each do |elem|
      e = elem.strip
      count += ((e.size == 0) ? 0 : 1)
    end
    count
  end
  def won?()
    WIN_COMBINATIONS.each do |arr|
      b_0 = @board[arr[0]].strip
      b_1 = @board[arr[1]].strip
      b_2 = @board[arr[2]].strip
      
      if ((b_0 == b_1) && (b_0 == b_2)) && b_0 != ""
        return [arr[0], arr[1], arr[2]]
      end
    end
    false
  end
  def full?()
    count = 0
    @board.each do |elem|
      e = elem.strip
      count += ((e.size == 0) ? 0 : 1)
    end
    count == 9
  end
  
  def draw?()
    w = won?()
    f = full?()
    
    if w
      return false
    elsif !w && !f
      return false
    elsif !w && f
      return true
    else
      return false
    end
    
  end
  
  def over?()
    w = won?()
    f = full?()
    d = draw?()
    
    w || f || d ? true : false
  end
  
  def winner()
    w = won?()
    
    if !w 
      return nil
    else
      return @board[w[0]]
    end
    
  end
  
  def play()
    until (over?()) do
      turn()
    end
    
    if won?()
      winner_ = winner()
      puts "Congratulations #{winner_}!"
    else
      puts "Cat's Game!"
    end
  end
  
end