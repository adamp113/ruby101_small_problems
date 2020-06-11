# SMALL PROBLEMS EASY 3

# Title 	Status
# 1 	Searching 101 	completed
# 2 	Arithmetic Integer 	completed
# 3 	Counting the Number of Characters 	completed
# 4 	Multiplying Two Numbers 	completed
# 5 	Squaring an Argument 	completed
# 6 	Exclusive Or 	completed
# 7 	Odd Lists 	completed
# 8 	Palindromic Strings (Part 1) 	completed
# 9 	Palindromic Strings (Part 2) 	completed
# 10 	Palindromic Numbers 	completed




# 3.1: SEARCHING 101


# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

array = []

loop do
  break if array.size == 5
  puts "enter a number to add to the list:"
  array << gets.chomp.to_i
end

puts "what is your last number?"
last = gets.chomp.to_i

if array.include?(last)
  puts "The number #{last} appears in #{array}"
else
  puts "The number #{last} does NOT appear in #{array}"
end

# 3.2: ARITHMETIC INTEGER



# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

puts "Enter the first number:"
first = gets.chomp.to_i

puts "Enter the second number:"
second = gets.chomp.to_i

add = first + second
subtract = first - second
multiply = first * second
divide = first / second

puts "#{first} + #{second} = #{add}"
puts "#{first} - #{second} = #{subtract}"
puts "#{first} * #{second} = #{multiply}"
puts "#{first} / #{second} = #{divide}"



# 3.3: COUNTING THE NUMBER OF CHARACTERS


# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# input:

# Please write word or multiple words: walk

# output:

# There are 4 characters in "walk".

# input:

# Please write word or multiple words: walk, don't run

# output:

# There are 13 characters in "walk, don't run".

puts "Give me your word or words:"
string = gets.chomp

number_of_characters = string.delete(' ').size

puts "there are #{number_of_characters} characters in #{string}."

#OR

puts "Give me your word or words:"
string = gets.chomp

number_of_characters = string.split.join.size

puts "there are #{number_of_characters} characters in #{string}."

# 3.4: MULTIPLYING TWO NUMBERS

# Create a method that takes two arguments, multiplies them together, and returns the result.

# Example:

# multiply(5, 3) == 15

def multiply(a, b)
  a * b
end

multiply(5, 3) == 15

# 3.5: SQUARING AN ARGUMENT

# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

# Example:

# square(5) == 25

def square(n)
  multiply(n, n)
end

# OR

def square(n)
  n * n 
end

square(5) == 25
square(-8) == 64

# 3.6: EXCLUSIVE OR

# The || operator returns a truthy value if either or both of its operands are truthy, a falsey value if both operands are falsey. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise.

# Examples:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

def xor?(val1, val2)
  (val1 && !val2) || (val2 && !val1)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# 3.7: ODD LISTS

# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

def oddities(array)
  array.select do |element|
    array.index(element).even?
  end
end

#OR THIS IS BETTER

def oddities(array)
  array.select.with_index {|item, index| index.even?}
end 

#OR

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end


oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []


# 3.8: PALINDROMIC STRINGS (PART 1)

# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

#   Examples:
  
#   palindrome?('madam') == true
#   palindrome?('Madam') == false          # (case matters)
#   palindrome?("madam i'm adam") == false # (all characters matter)
#   palindrome?('356653') == true
  
def palindrome?(string)
  string == string.reverse
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

# 3.9: PALINDROMIC STRINGS (PART 2)

# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

#   Examples:
  
#   real_palindrome?('madam') == true
#   real_palindrome?('Madam') == true           # (case does not matter)
#   real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
#   real_palindrome?('356653') == true
#   real_palindrome?('356a653') == true
#   real_palindrome?('123ab321') == false

def real_palindrome?(string)
  clean_words = string.downcase.delete('^a-z0-9')
palindrome?(clean_words)
end



real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

# 3.10: PALINDROMIC NUMBERS

# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

def palindromic_number?(integer)
  palindrome?(integer.to_s)
end


palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
