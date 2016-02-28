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

  def move(input, player)
    @board[input.to_i-1] = player
  end

  def position_taken?(input)
    !(@board[input.to_i] == " " || @board[input.to_i].nil?)
  end

  def valid_move?(input)
    position_taken?(input.to_i-1) == false && input.to_i.between?(1,9)
  end

  def turn
    input = gets.strip
    until valid_move?(input)
      puts "That's not a valid move! Try Again"
      input = gets.strip
    end
    player = current_player
    move(input, player)
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if position_taken?(combination[0])
        if @board[combination[0]] == @board[combination[1]] && @board[combination[1]]== @board[combination[2]]
          return combination
        end
      end
    end
    false
  end

  def full?
    @board.all? do |taken|
      taken!= " "
      end
  end

  def draw?
    full? && !(won?)
  end

  def over?
    won? || draw?
  end

  def winner
    win_combo = won?
     if win_combo
       if @board[win_combo[0]] == " "
           nil
       else @board[win_combo[0]]
       end
     end
    end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end
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