class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i - 1
    return input
  end

  def move(input, token = "X")
    @board[input] = token
  end

  def position_taken?(input_to_index)
    if @board[input_to_index] == " "
      return false
    else return true
    end
  end

  def valid_move?(input_to_index)
    if position_taken?(input_to_index) == false && input_to_index.between?(0,8) == true
      return true
    else return false
    end
  end

  def turn

    puts "Enter a position 1-9"
    usr_choice = gets.strip
    usr_choice = input_to_index(usr_choice)
    while valid_move?(usr_choice) == false
      puts "try again"
      usr_choice = gets.strip
      usr_choice = input_to_index(usr_choice)
    end
    token = current_player
    move(usr_choice, token)
    puts display_board

  end

  def turn_count
    count = 0
    @board.each do |game_char|
      if game_char == "X" || game_char == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else return "O"
    end
  end

  def won?
    @winning_token = ""
    WIN_COMBINATIONS.each do |three_in_a_row|
      if @board[three_in_a_row[0]] == "X" && @board[three_in_a_row[1]] == "X" && @board[three_in_a_row[2]] == "X"
        @winning_token = "X"
        return three_in_a_row

        break
      elsif @board[three_in_a_row[0]] == "O" && @board[three_in_a_row[1]] == "O" && @board[three_in_a_row[2]] == "O"
        @winning_token = "O"
        return three_in_a_row.to_a
        break
      end
    end
    return false
  end

  def full?
    counts = Hash.new 0
    @board.each do |position|

      counts[position] += 1
    end

    total_moves = counts["X"] + counts["O"]

    if total_moves < 9
        return false
    else
        return true
    end

  end

  def draw? # NOW ITS YOUR TURN SAYS JOCELYN
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over? # SAME THING
    if won? != false || draw? == true
      return true
    else
      return false
    end
  end

  def winner
    if won? != false

      return @winning_token
    else
      return nil
    end

  end

  def play
    while over? != true
      turn
    end
    if winner != nil
      puts "Congratulations #{@winning_token}!"
      return @winning_token
    else
      puts "Cat\'s Game!"
      return nil
    end
  end

end
