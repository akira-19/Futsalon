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



(1..10).each do |num|
  prefec = %w(tokyo chiba saitama osaka kyoto fukuoka tokyo yamanashi shizuoka kanagawa)
  field = Field.new(name:  "ex_filed#{num}",
             email: "ex_f#{num}@ex.com",
             password: "password",
             password_confirmation: "password",
             prefecture: "#{prefec[num-1]}",
             city: "city",
             num_of_field: 3
             )
  field.save!
           end




tournament_company = TournamentCompany.new(name:  "ex_tour1",
             email: "ex_tour1@example.com",
             password: "password",
             password_confirmation: "password"
             )
tournament_company.save!

(1..30).each do |num|
  start_time = DateTime.new(2019,1,rand(10)+1,10,0,0)
  tournament = Tournament.new(name:  "tournament#{num}",
                              level: rand(10),
                              num_of_team: 6,
                              price: 20000,
                              field_id: rand(5)+1,
                              start_time: start_time,
                              end_time: start_time.since(3.hours),
                              tounament_company_id: 1
             )
  tournament.save!
end
