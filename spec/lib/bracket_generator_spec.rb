require 'spec_helper'
require 'bracket_generator'

describe BracketGenerator do
  let(:generator) { BracketGenerator.new(['team1', 'team2', 'team3', 'team4', 'team5', 'team6', 'team7', 'team8', 'team9', 'team10']) }

  describe 'team_count' do
    it 'should return the number of teams' do
      generator.team_count.should eq(10)
    end
  end

  describe 'split_teams' do
    it 'should return the teams array split in two' do
      generator.split_teams.count.should eq(2)
    end

    it 'should return each half for half the original length' do
      generator.split_teams[0].count.should eq(5)
    end
  end

  describe 'brackets' do
    it 'should return a has with the matches keys' do
      generator.brackets.count.should eq(5)
    end

    it 'should return the keys named matchX' do
      generator.brackets.first.first.should eq('match1')
    end
  end

  describe 'filled_brackets' do
    it 'should fill the brackets with paired teams' do
      generator.filled_brackets.first[1].count.should eq(3)
    end
  end
end
