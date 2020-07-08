# Small Problems Easy 9 

# 1 	Welcome Stranger 	
# 2 	Double Doubles 	
# 3 	Always Return Negative 	
# 4 	Counting Up 	
# 5 	Uppercase Check 	
# 6 	How long are you? 	
# 7 	Name Swapping 	
# 8 	Sequence Count 	
# 9 	Grade book 
# 10 	Grocery List 

# 9.1: Welcome Stranger

# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

# input: an array (name), a hash (title, occupation)
# output: combine the person's name and use their title and occupation

# pseudo: #combine name
            #
          # Use string interpoloation for name and title and occupation

def greetings(array, hash)
 puts "Hello #{array.join(' ')}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.

# 9.2: Double Doubles

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# input: integer
# output: either original number of doubled number

# pseudo: check if number size is even
            # if so -find middle of number 
              # check if integer from 0 to the middle are the same as middle to -1
              # if they are return the original number
        # else return double the original number



def twice(number)
  string_number = number.to_s
  middle = string_number.size / 2
  string_number[0, middle] == string_number[middle..-1] ? number : number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# 9.3: Always Return Negative

# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

#input: number
#output: negative number, or 0

#pseudo: check if number is greater than 0
          # if it is multiply it by negative 1
          # if it is not, retrn the number

def negative(num)
  if num > 0 
    num * -1
  else
    num
  end
end

#OR

def negatuive(num)
  number > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# 9.4: Counting Up

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

#input: integer
#output: array of all integers from 1 to the integer

#pseudo: create a range, call to_a on it

def sequence(num)
  (1..num).to_a
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# 9.5: Uppercase Check

# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

#input: string
#output: true or false (true if all alpha are uppercase) false otherwise
#rules: ignore non alpha characters

#pseudo: #check to see if the string has ANY lowercase letters
          #split the string into characters
          # iterate over each character
              #return false if any characters match lowercase letters
              # otherwise return true (ternary)
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

# 9.6: How Long are you?

# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

#input: string
#output: array (contains every word and it's length)

#pseudo: # split string into words (split) ['cow', 'sheep', 'chicken']
        # iterate over the array to find each word's length (map)
            # word + ' ' + word.size

def word_lengths(string) 
  string.split.map do |word|
    word + ' ' + word.length.to_s
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# 9.7: Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.


#input: string with 2 names
#output: string (last name, first name)

#pseudo: split string into words
        # use string interpolation

def swap_name(string)
  names = string.split
 "#{names[1]}, #{names[0]}"
end

#OR

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# 9.8: Sequence Count

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

#input: 2 integers (count, first_number)
#output: array starting at first_number and is count long

#pseudo: use the initial number as a times method
        # initialize a starting number based on first_number
          # add first_number to itself each time

def sequence(num1, num2)
  arr = []
  start_num = 0
  num1.times do 
   arr << (start_num += num2)
  end
  p arr
end

#OR

def sequence(count, first)
  (1..count).map { |value| value * first }
end


sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

# 9.9: Grade Book

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
# Numerical Score Letter 	Grade
# 90 <= score <= 100 	'A'
# 80 <= score < 90 	'B'
# 70 <= score < 80 	'C'
# 60 <= score < 70 	'D'
# 0 <= score < 60 	'F'

# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

#input: 3 scores
#output: Letter grade (based on average)

#pseudo: save as avg = add all of the three values together and divide by 3.0
        # Conditional statements

def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3) / 3.0
  rounded = avg.round

  if rounded >= 90
    "A"
  elsif rounded >= 80
    "B"
  elsif rounded >= 70
    "C"
  elsif rounded >= 60
    "D"
  else "F"
  end
end

#OR

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# 9.10: Grocery List

#Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

#input: array of arrays
#output: one array

#pseudo: initialize a new empty array 
        # iterate over the array using each |fruit, num|
            #num.times do 
              #new_array << fruit

def buy_fruit(array)
   new_array = []
   array.each do |fruit, num|
     num.times { new_array << fruit}
   end
  new_array
end

#OR

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end


buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]