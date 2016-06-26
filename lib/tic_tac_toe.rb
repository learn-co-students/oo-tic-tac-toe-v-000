class TicTacToe

  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], #right column
    [0,4,8], # diag_1
    [6,4,2]  # diag_2
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

  def move(location, current_player = "X")
    location = location.to_i - 1
    @board[location] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location = location.to_i - 1

    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input#.to_i # -1



    if valid_move?(location)
      player_token = current_player
      move(location, player_token)# player_token)

      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that 'X' won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination # return the win_combination indexes that 'O' won.
        else
          return_value = false
      end #if

    end #1st do
     if return_value = false
      return_value
    end
  end # of won?

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end # of full?

  def draw?
  win_state = won?
  full_state = full?

  if !win_state && full_state # Test for a draw
      draw_state = true
    elsif win_state #= true) # test for a win
        draw_state = false
      elsif !win_state && !full_state # test for incomplete
          draw_state = false
  end
  draw_state
  end # of draw?

  def over?
  over_state = false

  if draw?
      over_state = true
    elsif won?
      over_state = true
      elsif full?
        over_state = true
  end
  over_state
  end #of over?

  def winner

  if won?
    win_array = won?
    token = @board[win_array[0]]
  end

  token
  end # of winner?

  def play

  until over? do
    turn
  end # do

  if won?
      winner_token = winner
      puts "Congratulations #{winner_token}!"
    elsif draw?
        puts  "Cats Game!"
  end #if
  end # play




end
