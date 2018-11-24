# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do

  it "is valid with a Name, email, password" do
    player = Player.new(
      name: "akira",
      email: "example@test.com",
      password: "password",
      password_confirmation: "password"
    )
    expect(player).to be_valid
  end

  it "is invalid without a name" do
    player = Player.new(name: nil)
    player.valid?
    expect(player.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a email" do
    player = Player.new(email: nil)
    player.valid?
    expect(player.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    player = Player.new(password: nil)
    player.valid?
    expect(player.errors[:password]).to include("can't be blank")
  end
end
