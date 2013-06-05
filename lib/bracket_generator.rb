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
      raise "Team array not even, Tourney does not yet work with even team groups."
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
    shuffled_teams.each_slice(team_count/2).to_a
  end

  # TODO: Can probably be refactored.
  # Public: The matches for the first round. Each match is an Array containing
  # both teams and the round number.
  #
  # Returns a Hash.
  def filled_brackets
    sorted_teams = split_teams
    first_half = sorted_teams[0]
    second_half = sorted_teams[1]
    empty_brackets = brackets

    empty_brackets.each_with_index do |(match), idx|
      empty_brackets[match] = [first_half[idx], second_half[idx], 1]
    end
    empty_brackets
  end

  # Public: Initializes the hash containing the matches in the first round.
  #
  # Returns a Hash.
  def brackets
    matches = {}
    (team_count/2).times { |i| matches["match#{i + 1}"] = [] }
    matches
  end
end
