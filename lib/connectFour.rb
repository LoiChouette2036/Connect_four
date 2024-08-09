require_relative 'board.rb'
require_relative 'player.rb'

#initialize board
board = Board.new
board.display

#initialize player
player1 = Player.new
print "Player 1 "
player1.get_symbol
player2 = Player.new
print "player 2 "
player2.get_symbol

#initalize game
puts "The game can begin"
i = 0
current_player= nil

while !board.check_for_win && !board.check_for_draw
    if i.even?
        current_player = player1
        print "player 1 : "
    else
        current_player = player2
        print "player 2 : "
    end

    current_player.make_move(board)
    board.display
    i+=1
end

