D4 = [1..4]
D6 = [1..6]
D8 = [1..8]
D10 = [1..10]
D12 = [1.. 2]
D100 = [1..100]
D20 = [1..20]

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

puts "ADVANTAGE METHOD"
puts advantage(D100)

puts "DISADVANTAGE METHOD"
puts disadvantage(D100)

puts "ADVANTAGE"
ascore1 = rand(D100[0])
ascore2 = rand(D100[0])
puts ascore1
puts ascore2
if ascore1 >= ascore2
    puts ascore1
else
    puts ascore2
end

puts "DISADVANTAGE"
dscore1 = rand(D100[0])
dscore2 = rand(D100[0])
puts dscore1
puts dscore2
if dscore1 >= dscore2
    puts dscore2
else
    puts dscore1
end

puts "REPEAT TEST"

repeat = advantage(D100)
puts repeat
puts repeat
puts repeat

repeat2 = disadvantage(D100)

puts repeat2
puts repeat2
puts repeat2