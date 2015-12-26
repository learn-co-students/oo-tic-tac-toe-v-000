 





### ATTEMPT at turn method

  def turn(position, token = "X")
    puts "Please enter an available spot, from 1-9."
    position = gets.strip
    if valid_move?(position)
       move
       display_board
      else 
        loop do
        puts "Please choose an empty spot from 1-9."
        position = gets.strip
        if valid_move?(position)
           move
           display_board
        break
      end
    end