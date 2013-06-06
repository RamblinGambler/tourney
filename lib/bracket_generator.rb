# Public: Contains the necessary methods to build the first brackets Hash.
# Later, this Hash will be modified via MatchProcessor.
#
class BracketGenerator
  # Public: Initialize a BracketGenerator. It will fail to initialize if the
  # teams array is not even.
  #
  # teams - An Array of Strings indicating the team names.
  def initialize(teams)
    if teams.length % 2 == 0
      @teams = teams
    else
      raise "Team array not even, Tourney does not yet work with odd team groups."
    end
  end

  # Public: The team array shuffled.
  #
  # Returns an Array.
  def shuffled_teams
    @teams.shuffle
  end

  # Public: The amount of teams registered.
  #
  # Returns an Integer.
  def team_count
    @teams.length
  end

  # Public: The shuffled array split in two.
  #
  # Returns an Array of Arrays.
  def split_teams
    @split_teams ||= shuffled_teams.each_slice(team_count/2).to_a
  end

  # Public: The matches for the first round. Each match is an Array containing
  # both teams and the round number.
  #
  # Returns a Hash.
  def filled_brackets
    Hash[split_teams.first.zip(split_teams.last).map.with_index(1) { |pair, idx| [idx, pair] }]
  end

  # Public: Assings the generated brackets to the first round.
  #
  # Returns a Hash.
  def first_round
    { round1: filled_brackets }
  end
end
