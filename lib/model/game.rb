# frozen_string_literal: true

require_relative "board"

class Game
  attr_reader :active_player, :winner, :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @active_player = player1
    @winner = nil
    @board = Board.new
  end

  # returns boolean, true game still is on, false game is ended
  def move(cell_ind)
    winner_piece = @board.judge(cell_ind, @active_player.piece)

    if winner_piece.nil?
      toggle_player
      return true
    end

    @winner = winner_by_piece(winner_piece)
    false
  end

  private def toggle_player
    @active_player = @active_player == @player1 ? @player2 : @player1
  end

  private def winner_by_piece(piece)
    return @player1 if @player1.piece == piece
    return @player2 if @player2.piece == piece

    nil
  end
end
