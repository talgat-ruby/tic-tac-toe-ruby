# frozen_string_literal: true

require_relative "tic_tac_toe_ruby/version"
require_relative "view/view"

module TicTacToeRuby
  class Error < StandardError; end

  view = View.new
  view.run
end
