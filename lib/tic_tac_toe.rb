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
    user_input.to_i - 1
  end

  def move(index, current_player)
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
    input = gets.chomp
    input_to_index(input)
    index = input.to_i - 1
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
    end
  end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
   WIN_COMBINATIONS.find do |win_combination|
     win_combination.all?{|index| @board[index] == "X"} ||
     win_combination.all?{|index| @board[index] == "O"}
   end
  end

  def full?
   @board.all?{|token|  token == "X" || token == "O"}
  end


  def draw?
   !won? && full?
  end

  def over?
   draw? || won?
  end


  def winner
   return nil unless won?
    if won?
      index = won?[0]
      @board[index]
    end
   end

   def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
      end
    end
  end
