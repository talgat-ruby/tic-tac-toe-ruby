# frozen_string_literal: true

require_relative "../model/player"
require_relative "../model/piece"
require_relative "../model/game"

class View
  def run
    player1_name = prompt("Please enter player1(x) name: ")
    player2_name = prompt("Please enter player2(x) name: ")

    player1 = Player.new(player1_name, PIECE[:x])
    player2 = Player.new(player2_name, PIECE[:o])

    game = Game.new(player1, player2)

    start_game(game)
    complete_game(game)
  end

  private def start_game(game)
    proceed = true

    while proceed
      ind = prompt("#{game.active_player.name}(#{game.active_player.piece}) please enter your next move index: ").to_i
      proceed = game.move(ind)
      game.board.print
    end
  end

  private def complete_game(game)
    return unless game.winner.nil?

    puts "It is a draw!"

  end

  private def prompt(message)
    print message
    gets.chomp
  end
end
