require 'spec_helper'
require 'bracket_generator'

describe BracketGenerator do
  let(:teams) { ['team1', 'team2', 'team3', 'team4', 'team5', 'team6', 'team7', 'team8', 'team9', 'team10'] }
  let(:generator) { BracketGenerator.new(teams) }
  let(:split_teams) {[['team1', 'team2', 'team3', 'team4', 'team5'], ['team6', 'team7', 'team8', 'team9', 'team10']] }
  let(:matched_teams) { { 1 => ['team1', 'team6'], 2 => ['team2', 'team7'], 3 => ['team3', 'team8'], 4 => ['team4', 'team9'], 5 => ['team5', 'team10']} }
  let(:first_round) { { round1: matched_teams } }

  describe 'team_count' do
    it 'should return the number of teams' do
      generator.team_count.should eq(10)
    end
  end

  describe 'split_teams' do
    it 'should return the teams array split in two' do
      generator.stub(:shuffled_teams).and_return(teams)
      generator.split_teams.should eq(split_teams)
    end
  end

  describe 'filled_brackets' do
    it 'should fill the brackets with paired teams' do
      generator.stub(:split_teams).and_return(split_teams)
      generator.filled_brackets.should eq(matched_teams)
    end
  end

  describe 'first_round' do
    it 'should fill the brackets with paired teams' do
      generator.stub(:filled_brackets).and_return(matched_teams)
      generator.first_round.should eq(first_round)
    end
  end
end
