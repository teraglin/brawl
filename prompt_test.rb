require "tty-prompt"
prompt = TTY::Prompt.new


input = prompt.select("yes no maybe so?", %w(yes no maybe))

if input == "yes"
    puts "works"
else
    puts "nope"
end

