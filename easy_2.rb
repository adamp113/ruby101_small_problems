#EASY 2 QUESTIONS

# Title 	Status
# 1 	How old is Teddy? 	completed
# 2 	How big is the room? 	completed
# 3 	Tip calculator 	completed
# 4 	When will I Retire? 	completed
# 5 	Greeting a user 	completed
# 6 	Odd Numbers 	completed
# 7 	Even Numbers 	completed
# 8 	Sum or Product of Consecutive Integers 	completed
# 9 	String Assignment 	completed
# 10 	Mutation 	completed



# 2.1: HOW OLD IS TEDDY?

# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

age = rand(20..200)
puts "Teddy's age is #{age}"



# How big is the room?

# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

SQMETER_TO_SQFEET = 10.7639

puts "Enter the length of the room in meters"
length = gets.chomp.to_f 

puts "Enter hte width of the room in meters"
width = gets.chomp.to_f 

area = (length * width).round(2)
sqfeet_area = (area * SQMETER_TO_SQFEET).round(2)
puts "The area of the room is #{area} square meters (#{sqfeet_area})"



# 2.2: TIP CALCULATOR

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

puts "What's the bill?"
bill = gets.chomp.to_f 

puts "what's the tip percent"
tip_percent = gets.chomp.to_f

tip = bill * (tip_percent / 100)
total = bill + tip

puts "your tip is $#{format('%.2f', tip)}"
puts "your total is $#{format('%.2f', total)}"



# 2.3: WHEN WILL I RETIRE?

# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts "What is your age?"
age = gets.chomp.to_i

puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i

current_year = Time.now.year
working_years = retirement_age - age
retirement_year = current_year + working_years

puts "it's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{working_years} of work to go!"


# 2.4: GREETING A USER

# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

puts "What's your name?"
name = gets.chomp

if name.include?('!')
  puts "HELLO #{name[0..-2].upcase}. WHY ARE WE SCREAMING!"
else
  puts "Hello #{name}"
end

# OR 

if name[-1] == '!'
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# 2.5: ODD NUMBERS



# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

range = (1..99)
 range.each do |num|
  puts num if num.odd?
 end

 # OR

 value = 1
 while value <= 99
  puts value
  value += 2
 end

# 2.7: EVEN NUMBERS

# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.
 
range = (1..99)
 range.each do |num|
  puts num if num.even?
 end

 # OR

 value = 2
 while value < 100
  puts value
  value += 2
 end


# 2.8: SUM OR PRODUCT OF CONSECUTIVE INTEGERS

# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

puts "please enter an integer greater than 0"
number = gets.chomp.to_i

puts "enter 's' to compute the sum, 'p' to compute the product" 
operation = gets.chomp

if operation == 's'
 answer = (1..number).reduce(:+)
 puts "the sum of the integers between 1 and #{number} is #{answer}."
elsif operation == 'p'
  answer = (1..number).reduce(:*)
  puts "the produce of the integers between 1 and #{number} is #{answer}"
else
  "that's not a valid option"
end
answer

# OR 

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end

# 2.9: STRING ASSIGNMENT

# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

# Alice
# Bob

# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?


# 2.10 MUTATION

# What will the following code print, and why? Don't run the code until you have tried to answer.

# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2



