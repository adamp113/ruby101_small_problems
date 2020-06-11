
#     Title 	Status
# 1 	Repeat Yourself 	completed
# 2 	Odd 	completed
# 3 	List of Digits 	completed
# 4 	How Many? 	completed
# 5 	Reverse It (Part 1) 	completed
# 6 	Reverse It (Part 2) 	completed
# 7 	Stringy Strings 	completed
# 8 	Array Average 	completed
# 9 	Sum of Digits 	completed
# 10 	What's my Bonus? 	completed


# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3)

# Output:

# Hello
# Hello
# Hello

def repeat(string, num)
  num.times do
  puts string
  end
end

repeat('Hello', 3)