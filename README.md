# Tourney

Tourney is a Tournament Bracket manager gem for ruby applications.

## Installation

Add this line to your application's Gemfile:

    gem 'tourney'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tourney

## Usage

### Generating first round

To generate a Hash containing the matches for the first round you just have to:

```ruby
round1 = Tourney.generate_first_round(array_of_teams)
```

Here is what happens behind this:

```ruby
> teams = ['team1', 'team2', 'team3', 'team4', 'team5', 'team6', 'team7', 'team8', 'team9', 'team10']

> Tourney.generate_first_round(teams)
#=> { round1: { 1 => ['team1', 'team6'], 2 => ['team2', 'team7'], 3 => ['team3', 'team8'], 4 => ['team4', 'team9'], 5 => ['team5', 'team10']} }
```

Although the format is always the same, the pairing system matches teams
in a random order, that's to say, if you run `generate_first_round(teams)`
method twice, the output for each time **will be different**.

### Managing match outcome
This part is still WIP.

## TODO
* Add support for odd team groups.
* Add the match outcome processor
  * Should handle single and double elimination brackets.

## License
MIT License. Copyright 2013 Dor3nz
