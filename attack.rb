require "tty-prompt"
prompt = TTY::Prompt.new

#DICE VALUES
D4 = [1..4]
D6 = [1..6]
D8 = [1..8]
D10 = [1..10]
D12 = [1.. 2]
D100 = [1..100]
D20 = [1..20]

#MONSTER
mon_health = 20
current_mon_health = 20
mon_armour_class = 10

#PLAYER
player_health = 20
current_player_health = 20
player_armour_class = 12

#UNIVERSAL
roll_choice = true
hit_score = 0
CRITICAL_HIT = 20

def roll(dice)
    result = rand(dice[0])
    return result
end

def player_damage(dice)
    score = rand(dice[0])
    return score
end

def mon_damage(dice)
    score = rand(dice[0])
    return score
end

def advantage(dice)
    score1 = rand(dice[0])
    score2 = rand(dice[0])
    if score1 >= score2
        return score1
    else
        return score2
    end
end

def disadvantage(dice)
    score1 = rand(dice[0])
    score2 = rand(dice[0])
    if score1 >= score2
        return score2
    else
        return score1
    end
end

def straight(dice)
    score = rand(dice[0])
    return score
end

def monster_attack(player_input)
    if player_input == "RECKLESS"
        hit_score = advantage(D20)
    elsif player_input == "DEFENSIVE"
        hit_score = disadvantage(D20)
    elsif player_input == "BALANCED"
        hit_score = straight(D20)
    end
    return hit_score
end


while current_mon_health > 0

    system('clear')

    while roll_choice == true
        puts "PLAYER HP: #{current_player_health}/#{player_health}"
        puts "MONSTER HP: #{current_mon_health}/#{mon_health}"
        
        input = prompt.select("How do you want to attack the creature?", %w(BALANCED DEFENSIVE RECKLESS))

        if input == "RECKLESS"
            hit_score = advantage(D20)
            puts "You attack your enemy all out in an agressive rage!"
            puts "You roll two die to hit and use the highest roll..."
            break
        elsif input == "DEFENSIVE"
            hit_score = disadvantage(D20) 
            puts "You maintain your guard and attack cautiously."
            puts "You roll two die to hit and use the lowest roll..."
            break
        elsif input == "BALANCED"
            hit_score = straight(D20)
            puts "You keep your balance and stick to the fundamentals of stabbing things with sharp weapons"
            puts "You roll one dice to hit..."
            break
        end
    end

    system('clear')

    if hit_score == CRITICAL_HIT
        turn_damage = (player_damage(D8) + player_damage(D8)) + 2
        current_mon_health -= turn_damage
        puts "PLAYER HP: #{current_player_health}/#{player_health}"
        puts "MONSTER HP: #{current_mon_health}/#{mon_health}"
        puts "CRITICAL HIT!!"
        puts "You hit for #{hit_score}!"
        puts "You did #{turn_damage} points of damage" 
    elsif hit_score >= mon_armour_class
        turn_damage = player_damage(D8) + 2
        current_mon_health -= turn_damage
        puts "PLAYER HP: #{current_player_health}/#{player_health}"
        puts "MONSTER HP: #{current_mon_health}/#{mon_health}"
        puts "You hit for #{hit_score}!"
        puts "You did #{turn_damage} points of damage"
    else
        puts "You miss!"
    end

    if current_mon_health <= 0
        break
    else
        puts " "
        puts "It's now the monster's turn"
        puts "press any key"
        gets
        system('clear')
    end

    # dialogue for moster attack

    monster_hit = monster_attack(input)
    
    if monster_hit == CRITICAL_HIT
        mon_turn_damage = (mon_damage(D6) + mon_damage(D6)) + 2
        current_player_health -= mon_turn_damage
        puts "PLAYER HP: #{current_player_health}/#{player_health}"
        puts "MONSTER HP: #{current_mon_health}/#{mon_health}"
        puts "CRITICAL HIT!!"
        puts "The monster hit you for #{monster_hit}!"
        puts "You take #{mon_turn_damage} points of damage" 
    elsif monster_hit >= player_armour_class
        mon_turn_damage = mon_damage(D6) + 2
        current_player_health -= mon_turn_damage
        puts "PLAYER HP: #{current_player_health}/#{player_health}"
        puts "MONSTER HP: #{current_mon_health}/#{mon_health}"
        puts "The monster hit you for #{monster_hit}!"
        puts "You take #{mon_turn_damage} points of damage" 
    else
        puts "The monster's attack misses you!"
    end

    if current_player_health <= 0
        break
    else
        puts " "
        puts "It's now the your turn"
        puts "press any key to attack again"
        gets
        system('clear')
    end
end

puts current_player_health
puts current_mon_health

if current_mon_health <= 0
    puts "VICTORY!"
    puts "You killed the monster"
else
    puts "DEATH!"
    puts "The monster was too much for you."
    puts "You fall backward and feel your conciousness slip into the abyss..."
end

puts "Play Again?"


continue = prompt.select("Play Again?", %w(YES NO))

if continue == "NO"
    puts "Thanks for playing!!"
    exit
elsif continue == "YES"
    load('attack.rb')
end
