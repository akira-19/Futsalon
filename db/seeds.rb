# frozen_string_literal: true
player = Player.new(name:  "example",
             email: "example@example.com",
             password: "password",
             password_confirmation: "password"
             )
player.save!
