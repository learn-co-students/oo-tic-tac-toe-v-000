class TicTacToe

  def initialize (board = nil)
    @board= board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index = index.to_i-1
  end

  def move(index, player = 'X')
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == true  || index.between?(0,8) != true
      false
    else true
  end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index=input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else puts "Space taken or invalid - Choose another number from 1-9"
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
        if space == "X" || space == "O"
              counter+= 1
        end
    end
        counter
  end

  def current_player
    if turn_count % 2 == 0
       "X"
    else  "O"
    end
  end

  def won?
   WIN_COMBINATIONS.find do |combo|
          @board[combo[0]] == @board[combo[1]] &&
          @board[combo[1]] == @board[combo[2]] &&
          position_taken?(combo[0])
        end
      end

      def full?
        @board.all? do |token|
        token == "X" || token == "O"
          end
        end

      def draw?
            full? && !won?
        end

        def over?
          won? || draw?
        end

        def winner
          if won?
            @board[won?[0]]
          end
          end

        def play
          until over?
            turn
        end


      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end
