class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
  
    [0,4,8],
    [2,4,6],
  
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ];
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "];
    
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1;
    user_input;
  end
  
  def move(position, player_token)
    @board[position] = player_token;
    @board;
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false;
    elsif @board[index] == "X" || @board[index] == "O"
      return true;
    end
  end

  def valid_move?(index)
    if position_taken?(index) || @board[index] == nil
      return false;
    elsif index > 8 || index < 0
      return false;
    elsif !position_taken?(index)
      return true;
    end
  end

  def turn_count
    occupied_positions = 0;
    i = 0;
    while i < 9 do
      if @board[i] == "X" || @board[i] == "O"
        occupied_positions += 1;
      end #endif
      i += 1;
    end # end until
    return occupied_positions;
  end#end foo

  def current_player
    occupied_positions = turn_count();
    if occupied_positions % 2 == 0
      return "X";
    else
      return "O";
    end
  end

  def turn
    puts "Please enter 1-9:"
    player_token = current_player();
    index = gets.strip;
    index = input_to_index(index);
    if valid_move?(index)
      move(index, player_token);
    else
      until valid_move?(index) && (player_token == "X" || player_token == "O")
        puts "Please enter 1-9:";
        index = gets.strip;
        index = input_to_index(index);
      end
      move(index, player_token);
    end
    puts "Moved #{player_token} to #{index}!"
    display_board();
  end

  def won?
    empty_board = @board.all? do |cell|
      cell == " ";
    end
    found_win = WIN_COMBINATIONS.detect do | combo |
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ) || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" )
    end
    if found_win == nil || empty_board
      return false
    else
      return found_win
    end
  end

  def draw?
    if won?()
      return false;
    elsif full?()
      return true;
    else
      return false;
    end
  end
  
  def full?
    full_board = @board.all? do | slot |
      slot == "X" || slot == "O"
    end
    return full_board;
  end

  def over?
    if draw?() || won?()
      return true
    else
      return false
    end
  end

  def winner
    winning_coords = won?()
    if winning_coords != false
      if @board[winning_coords[0]].include?("X");
        return "X";
      elsif @board[winning_coords[0]].include?("O")
        return "O";
      else
        return nil;
      end# endif X | Y | nil
    end# endif boolean
  end

  def play
    while !over?() #check if the game is over
      turn();
    end
    token_winner = winner(); #get the winner
    #output message based on the winner
    if token_winner == "X"
      puts "Congratulations X!";
    elsif token_winner == "O"
      puts "Congratulations O!";
    else
      puts "Cat's Game!";
    end
  end

end
