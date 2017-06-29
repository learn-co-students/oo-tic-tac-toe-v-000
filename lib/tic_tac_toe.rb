class TicTacToe
  def initialize (board=[" ", " ", " ", " ", " ", " ", " ", " ", " ",])
    @board=board
  end

  WIN_COMBINATIONS =[
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

    def input_to_index(number)
    number.to_i-1
    end

    def turn_count
    @board.count {|token| token=="X"||token=="O"}
    end

    def current_player
    if turn_count % 2==0
      current_player="X"
    else
      current_player="O"
    end
    end




    def move(index,current_player)
    @board[index]=current_player
    end

    def turn
      puts "Please enter 1-9:"
     index=input_to_index(gets.strip)
      until valid_move?(index)
      puts "Please enter 1-9:"
      index=input_to_index(gets.strip)

      end

    move(index,current_player)
    display_board

  end





    def position_taken?(index)

    if (@board[index]==" ")||(@board[index]=="")||(@board[index]==nil)
      false
    elsif (@board[index]== "X")||(@board[index]=="O")
       true
    end
  end

  def valid_move?(index)
      if (index>=0) && (index<=8) && (index % 1==0) && !(position_taken?(index))
      true
    else
      false
      end
  end


  def won?
      false
    WIN_COMBINATIONS.any? do |win_combination|

      if position_taken?(win_combination[0]) &&
        @board[win_combination[0]]==@board[win_combination[1]] &&
        @board[win_combination[0]] == @board[win_combination[2]]
      return win_combination
     end
    end
  end

  def full?
    false
    @board.all? do |position|
      if position =="X"||position=="O"
        true
      end
    end
  end
  def draw?
      false
    if full?&&!won?
      true
    end
  end

  def over?
      false
    if won?||full?||draw?
        true
    end
  end

  def winner
      if won?
        @board[won?[0]]
      else
        nil
      end
  end

  def play
      while !over?
        turn
      end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
  end

end
