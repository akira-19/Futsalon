# frozen_string_literal: true
player = Player.new(name:  "example",
             email: "example@example.com",
             password: "password",
             password_confirmation: "password"
             )
player.save!

player1 = Player.new(name:  "example1",
             email: "example1@example.com",
             password: "password",
             password_confirmation: "password"
             )
player1.save!




field = Field.new(name:  "ex_filed1",
             email: "ex_f1@ex.com",
             password: "password",
             password_confirmation: "password",
             prefecture: "Tokyo",
             city: "Koutouku",
             num_of_field: 3
             )
field.save!



tournament_company = TournamentCompany.new(name:  "ex_tour1",
             email: "ex_tour1@example.com",
             password: "password",
             password_confirmation: "password"
             )
tournament_company.save!
