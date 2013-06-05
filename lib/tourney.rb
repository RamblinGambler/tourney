require "tourney/version"
require "bracket_generator"

module Tourney

  def self.generate_brackets(teams)
    BracketGenerator.new(teams).filled_brackets
  end
end
