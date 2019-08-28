require_relative './RPN.rb'

def welcome
  STDOUT.puts "Welcome to the RPN calculator. To get started, please enter a number"
  number = STDIN.gets.chomp()
  case number
  when "1"
    STDOUT.puts "You entered 1"
    welcome
  when "exit"
    STDOUT.puts "goodbye"
    exit
  end
end


welcome
