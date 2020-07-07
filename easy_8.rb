# SMALL PROBLEMS EASY 8


# 1 	Sum of Sums 	
# 2 	Madlibs 	
# 3 	Leading Substrings 	
# 4 	All Substrings 	
# 5 	Palindromic Substrings 	
# 6 	fizzbuzz 	
# 7 	Double Char (Part 1) 	
# 8 	Double Char (Part 2) 
# 9 	Convert number to reversed array of digits 
# 10 	Get The Middle Character 	

# 8.1: Sum Of Sums

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

#input: array of numbers
#output: sum of the sums 

#pseudo: 

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end


sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

# 8.2: Madlips

    #DUMB


# 8.3: Leading Substrings

#Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

def substrings_at_start(string)
  total = ''
  new_arr = string.chars.map do |char|
    total += char
  end
  new_arr
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# 8.4: All Substrings

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

def substrings(string)
  counter = 0
  final_arr = []
  loop do
    break if counter == string.chars.size
    final_arr << substrings_at_start(string[counter..-1])
    counter += 1
  end
   final_arr.flatten
end

# OR

# def substrings(string)
#   results = []
#   (0..string.size).each do |start_idx|
#     current_substring = string[start_idx..-1]
#     restults.concat(substrings_at_start(current_substring))
#   end
#   results
# end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# 8.5: Palindromic Substrings

# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

#input: string
#output: array (list of all palindromic substrings)

#pseudo: # save as all_subs = run the string through substrings method ['a', 'ab', 'abc', 'b', 'bc']
        # iterate over all_subs (select) do |sub_string|
            # if sub_string.size > 1
               # sub_string == sub_string.reverse
            #end
          # return new array with selected elements


def palindromes(string)
    all_subs = substrings(string)
    final = all_subs.select do |sub_string|
      sub_string.size > 1 && (sub_string == sub_string.reverse)
    end
     final
end

#OR

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

 p palindromes('abcd') == []
 p palindromes('madam') == ['madam', 'ada']
 p palindromes('hello-madam-did-madam-goodbye') == [
   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
   '-madam-', 'madam', 'ada', 'oo'
 ]
 p palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']


# 8.6: fizzbuzz

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

#input: starting number, ending number
#output: all numbers between the two (substitute fizz for numbers % 3), (subs buzz for numbers %5)

#pseudo: create a range (start..end)
        #iterate over the range
        # if number is evenly divisible by both 5 and 3, return FizzBuzz
          # if number is evenly divisible by 5 retun Buzz
          # if number is evenly divisible by 3 return Fizz
        #otherwise return number


def fizzbuzz(num1, num2)
  results = []
  (num1..num2).each do |num|
    if num % 5 == 0 && num % 3 == 0 
      results << "FizzBuzz" 
    elsif num % 5 == 0 
      results << "Buzz"
    elsif num % 3 == 0
      results << "Fizz"
    else
      results << num
  end
end
puts results.join(', ')
end

#OR

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

   fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuz

# 8.7: Double Char (Part 1)

# Write a method that takes a string, and returns a new string in which every character is doubled.

#input: string
#output: NEW string (every character doubled)

#pseudo: break string into characters
      #save to variable = iterate over each char (map) 
        # multiply each letter by 2
        # return the new array and
      # join array back into string (join)

def repeater(string)
 new_array = string.chars.map do |letter|
    letter + letter
 end
  new_array.join
end

#OR letter * 2

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# 8.8: Double Char (Part 2)

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

#input: string
#output: string (each consonant doubled)

#pseudo: # break string into characters
        # save to variable: iterate over the characters (map)
          # if character matches letters insensitive AND
            #if character is not included in aeiouAEIOU
            # double character
        # return the mapped array (join together to make string)

VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']

def double_consonants(string)
  final = string.chars.map do |char|
    if char =~ /[a-z]/i && !VOWELS.include?(char)
       char * 2
    else
      char
    end
  end
   final.join
end

#OR

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# 8.9: Convert Number to Reversed Array of Digits

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

# input: positive integer
# output: reversed digits

# pseudo: convert number to a string (to_s)
      # reverse the string (reverse)
      # convert the string back to integer (to_i)


def reversed_number(integer)
   new_str = integer.to_s
   new_str.reverse!
   new_str.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1


# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.


#input: string
#output: string of just middle character if odd
          #string of middle 2 characters if even
           
#pseudo: determine the middle index by dividing string size by 2.0 (ceil)
      # if string size divided by 2 is NOT 0 then return the middle character
      # if string size divided by 2 IS 0 then return the middle two characters (middle and mid -1)

def center_of(string)
    middle = (string.size / 2.0).floor
  if string.size % 2 != 0
     string[middle]
  else
     string[middle -1] + string[middle]
  end
end

 #OR

 def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

 p center_of('I love ruby') == 'e'
 p center_of('Launch School') == ' '
 p center_of('Launch') == 'un'
 p center_of('Launchschool') == 'hs'
 p center_of('x') == 'x'
