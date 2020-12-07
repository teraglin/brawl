run = true

d4 = [1..4]
d6 = [1..6]
d8 = [1..8]
d10 = [1..10]
d12 = [1.. 2]
d100 = [1..100]
d20 = [1..20]

def roll(dice)
    result = rand(dice[0])
    return result
end

puts roll(d20)