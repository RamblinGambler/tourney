require "tourney/version"
require "bracket_generator"

module Tourney

  def self.generate_first_round(teams)
    BracketGenerator.new(teams).first_round
  end
end
