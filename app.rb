

require 'bundler'
Bundler.require

# require_relative 'lib/game'
require_relative 'lib/player'
pl1 = Player.new("Bot_José")                #player1
pl2 = Player.new("Bot_GPT")  #player2


puts "A ma droite 'Bot_GPT': crée un nouveaux gladiateur!!"
puts "Et à ma gauche cela m'aurais étonner 'Bot_José': crée un nouveaux gladiateur!!"
puts "Voici les deux joueurs qui ce présente!"
puts "==============================="
pl1.show_state
puts "==============================="
pl2.show_state
puts "==============================="
puts "Lady and gentleman! RAAAAADYYYYY TOOOOO FIGH!!!"
puts "==============================="

while pl1.life_points > 0 && pl2.life_points > 0
  pl2.show_state
  pl1.show_state

  pl1.attacks(pl2)
  break if pl1.life_points == 0 || pl2.life_points == 0
  pl2.attacks(pl1)
  
end

