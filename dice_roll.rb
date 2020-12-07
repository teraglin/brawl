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

puts "what dice would you like to roll?"
puts "choose [4, 6, 8, 10, 12, 100, 20]"
puts "enter [0] to quit"

while run == true
    print "> D"

    sides = gets.chomp.to_i

    if sides == 4
        puts roll(d4)
    elsif sides == 6
        puts roll(d6)
    elsif sides == 8
        puts roll(d8)
    elsif sides == 10
        puts roll(d10)
    elsif sides == 12
        puts roll(d12)
    elsif sides == 100
        puts roll(d100)
    elsif sides == 20
        puts roll(d20)
    elsif sides == 0
        puts "See you later!!"
        exit
    elsif
        puts "INVALID INPUT TRY AGAIN"
    end
end

