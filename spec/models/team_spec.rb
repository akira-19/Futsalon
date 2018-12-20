require 'rails_helper'

RSpec.describe Team, type: :model do
  it "is invalid without name" do
    team = Team.new(name:"")
    team.valid?
    expect(team.errors[:name]).to include("can't be blank")
  end

  it "is invalid without level" do
    team = Team.new(level: nil)
    team.valid?
    expect(team.errors[:level]).to include("can't be blank")
  end

  it "is invalid without level test" do
    team = Team.new(level: nil)
    expect(team).to be_invalid
  end

  it "is invalid without level test" do
    team = Team.new(level: 3)
    expect(team).to be_invalid
  end
end
