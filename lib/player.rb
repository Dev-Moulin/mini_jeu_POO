

class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    @life_points
    puts"#{@name} à #{life_points} points de vie!!"
  end

  def gets_domage(domage_received)
    @life_points -= domage_received

    if @life_points == 3
      puts "Tu est proche de la mort!!"
    end

    if @life_points <= 0
      puts "Game Ove!! #{name} You are dead!!!"
      @life_points = 0
    end
  end

  def attacks(player)
    puts "#{@name} fait une attaque eclair à #{player.name}"
    attacks = compute_domage
    puts "Bim! In your face, ca fait #{attacks} de points en moins"
    player.gets_domage(attacks)
    
  end

  def compute_domage
    return rand(1..6)
  end
  
end

class HumanPlayer < Player
  attr_accessor :weapon_level
  #weapon_level.to_i???

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1

  end

  def show_state
    @life_points
    puts"#{@name} à #{life_points} points de vie!! Ah!! sacher que #{@name} possède une arme de niveau #{@weapon_level}!! Ca va saignée!!"
  end

  def search_weapon
    puts "#{@name} fait un lancer de dée!!"
    rand(1..6)
    puts"================================"
    puts"TADADINDIN!! WHAOU!! ta trouver une arme niveaux #{rand}!!"
    puts"================================"
    
    if rand > @weapon_level
      puts "Elle est de niveaux #{rand}!! ca fait #{rand - @weapon_level} de plus!! Cool, utilise la!"
    end
    if rand <= @weapon_level
      puts"M@*#$... elle n'est pas mieux que ton arme actuelle..."
      puts "#{name} jette l'arme.."
    end
  end

  def search_health_pack
    puts "#{@name} fait un lancer de dée!!"
    rand(1..6)
    puts"================================"
    puts"TA-DA-DIN-DIN!"
    puts"================================"
    if rand == 1
      puts"POUIN-POUIN-POUINN..."
    puts"================================"
      puts "Raaaahh!! même pas un mercurochrome...."
    elsif rand >= 2 || rand <= 5
      puts"TA-DIN-DIN-DIN!!!"
    puts"================================"
      puts "Hooo un petit rhum!!"
      puts "#{@name} gagne +50 pts de vie"
      @life_points + 50
    else rand > 5
      puts"TA-DIN-DIN-DIN!!!"
    puts"================================"
      puts "Hooo des chocapiques !!"
      puts "#{@name} gagne +80 pts de vie felicitation!!!"
      @life_points + 80
    end

  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
end



 
