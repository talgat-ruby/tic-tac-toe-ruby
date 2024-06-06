# frozen_string_literal: true

require_relative 'piece'

class Board
  COLS = 3
  ROWS = 3

  def initialize
    @data = Array.new(ROWS * COLS, PIECE[:empty])
  end

  def print
    puts "
      #{@data[0]} | #{@data[1]} | #{@data[2]}
     -----------
      #{@data[3]} | #{@data[4]} | #{@data[5]}
     -----------
      #{@data[6]} | #{@data[7]} | #{@data[8]}
    "
  end

  def judge(ind, active_piece)
    if @data[ind] != PIECE[:empty]
      puts "Selected cell(##{ind}) is already filled with piece #{@data[ind]}. Sorry but you lost the round."
      return active_piece == PIECE[:x] ? PIECE[:o] : PIECE[:x]
    end

    @data[ind] = active_piece

    first_in_row_ind = (ind / COLS) * COLS
    first_in_col_ind = ind % COLS
    win =
      # row
      assess(active_piece, first_in_row_ind, COLS, 1) ||
        # col
        assess(active_piece, first_in_col_ind, ROWS, COLS) ||
        # diagonal 1
        assess(active_piece, 0, COLS, ROWS + 1) ||
        # diagonal 2
        assess(active_piece, ROWS - 1, COLS, ROWS - 1)

    return active_piece if win

    draw = !@data.include?(PIECE[:empty])
    return PIECE[:empty] if draw

    nil
  end

  private def assess(piece, first_ind, total, step)
    i = first_ind

    total.times do
      return false if @data[i] != piece

      i += step
    end

    true
  end
end
