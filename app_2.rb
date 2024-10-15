

require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

pl1 = Player.new("Bot_José")                #player1
pl2 = Player.new("Bot_GPT")

def inscription
  puts "Hey!! Toi la!! vient t'inscrire!!"
  print ">"
  inscription_human = gets.chomp
  human_player = HumanPlayer.new(inscription_human)
  puts "Hey!! Salut #{human_player.name}!!"
  puts ""
  puts  "------------------------------------------------"
  puts  "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts  "|Le but du jeu est d'être le dernier survivant !|"
  puts  "-------------------------------------------------"
  puts ""
  puts  "tu va te battre contre Bot_José et Bot_GPT !!"
  return human_player
end

def menus(pl1, pl2)
    puts "============= Le Menu =============== "
    puts "| a - chercher une meilleure arme   |"
    puts "| s - chercher à se soigner         |"
    puts "| attaquer un joueur en vue :       |"
    puts "| 0 - #{pl2.name} a #{pl2.life_points} points de vie    |"
    puts "| 1 - #{pl1.name} a #{pl1.life_points} points de vie       |"
    # puts "| selection incorrect               |"
    puts "====================================="
  end

  def choix_user_menus(human_player, pl1, pl2)
    puts "Quelle action veux-tu effectuer ?"
    human_player_select = gets.chomp
    if  human_player_select == "a"
      human_player.search_weapon
    elsif  human_player_select == "s"
      human_player.search_health_pack
    elsif human_player_select == "0"
      human_player.attacks(pl2)
    elsif human_player_select == "1"
      human_player.attacks(pl1)
    else 
      puts "tu t'est trompé, prend ca dans ta geule!!"
    end
  end

  

# while pl1.life_points > 0 && pl2.life_points > 0 && human_player.name > 0
#   pl2.show_state
#   pl1.show_state
#   human_player.name.show_state
#   weapon_level.show_state
#   human_player.name.attacks
#   break if human_player.name.life_points == 0 || pl1.life_points == 0 || pl2.life_points == 0
#   pl2.attacks(human_player.name)
#   pl1.attacks(human_player.name)
# end
# while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
#   ...
#   end  

def end_game(human_player)
  if human_player.life_points > 0 
    puts "La partie est finie"
    puts "#{human_player} BRAVO ! TU AS GAGNE !"
  else
    puts "La partie est finie"
    puts "HAHAHAHA!!! #{human_player} t'est un loser ! Tu as perdu !"
  end
end

human_player = inscription
while human_player.life_points > 0 && (pl1.life_points > 0 or pl2.life_points > 0)
  human_player.show_state
  pl1.show_state
  pl2.show_state
  menus(pl1, pl2) 
  choix_user_menus(human_player, pl1, pl2)
  pl2.attacks(human_player) if pl2.life_points>0
  pl1.attacks(human_player) if pl1.life_points>0
end
end_game(human_player)