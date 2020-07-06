# SMALL PROBLEMS EASY 7
# 1 	Combine Two Lists 	completed
# 2 	Lettercase Counter 	completed
# 3 	Capitalize Words 	completed
# 4 	Swap Case 	completed
# 5 	Staggered Caps (Part 1) 	completed
# 6 	Staggered Caps (Part 2) 	Not completed
# 7 	Multiplicative Average 	completed
# 8 	Multiply Lists 	completed
# 9 	Multiply All Pairs 	completed
# 10 	The End Is Near But Not Here 	completed

# 7.1: COMBINE TWO LISTS

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(arr1, arr2)
  p arr1.zip(arr2).flatten
end

# OR

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# 7.2: LETTERCASE COUNTER

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# input: String
# output: hash

# * create a new hash with 3 keys and values all at 0
# * split the string up into characters
# *iterate through each character and determine if it is uppercase, lowercase, or neither
#   *if it is uppercase, increment upcase hash by 1
#     * If it is lowercase, increment lowercase hash by 1
#     * if it is neither increment neither by 1
# *return the hash

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  hash = {
            uppercase: 0,
            lowercase: 0,
            neither: 0
}

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      hash[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      hash[:lowercase] += 1 
    else
      hash[:neither] += 1
    end
  end
  hash
end

# OR

def letter_case_count(str)
  hash = {
    lowercase: str.count('a-z'),
    uppercase: str.count('A-Z'),
    neither: str.count('^a-zA-Z')
  }
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# 7.3: CAPITALIZE WORDS

# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# input: string
# output: new string but each word cap

# * split the string into individual words
# * capitalize each word
# * join the string back together with spaces

def word_cap(string)
  words = string.split
  words.each do |word|
    word.capitalize!
  end
  words.join(' ')
end

# OR

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

# OR

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# 7.4: SWAP CASE

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.



def swapcase(string)
  new = string.chars.map do |char|
    if UPPERCASE_CHARS.include?(char)
      char.downcase
    elsif LOWERCASE_CHARS.include?(char)
      char.upcase
    else
      char
    end
  end
  new.join
end

# OR 

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


# 7.5: STAGGERED CAPS (PART 1)



# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# input: String
# output: new String with every other letter caps

# * split the string up into characters
# * iterate through each character
#   * if the character's index is even 
#       uppercase the letter
#     *else if the chracter's index is odd
#       downcase the letter 
#   *Join the characters back together with no spaces between

def staggered_case(string)
  new = ''
  string.chars.each_with_index do |char, idx|
    if idx.even? 
       new << char.upcase 
    else 
      new << char.downcase
    end
  end
   new
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# 7.6 STAGGERED CAPS (PART 2)


# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.


LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  case_counter = 0

  chars = string.chars
  chars.each do |letter|
    if LETTERS.include?(letter)
      letter.upcase! if case_counter.even?
      letter.downcase! if case_counter.odd?
      case_counter += 1
    else letter
    end
  end
  chars.join
end



p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# 7.7: Multiplicative Average

# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.


#input: array
#output: float 3 decimal places

# assign total to = Multiply all of the integers together in the array [:*]
# Divide the total by number of elements (turned into a float) [array.size.to_f]
# print the result formatting to 3 decimals %f3

def show_multiplicative_average(array)
  total = array.inject(:*)
  avg = total / array.size.to_f
  puts "The result is #{format('%.3f', avg)}"
end

#OR


show_multiplicative_average([3, 5])
#The result is 7.500

show_multiplicative_average([6])
#The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667

# 7.8: Multiply Lists

# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

#input: 2 arrays
#output: 1 new array with product of each pair of numbers

# initialize a new empty array (multiplied_pairs)
# create a new array with sub arrays of paired numbers based on index (zip)
# multiply the pairs and add them to the new array
# return the new array


def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair.inject(:*) }
end

#OR

def multiply_list(arr1, arr2)
  products = []
  arr1.each_with_index do |item, idx|
    products << (item * arr2[idx])
  end
  products
end


p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]

# 7.9: Multiply All Pairs


# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

#input: 2 arrays
#output: 1 new array with product of every pair possible (sorted)


#pseudo: 
  # multiply the two arrays for each combination
  # 
  # sort the results

  def multiply_all_pairs(arr1, arr2)
    arr1.product(arr2).map {|pair| pair.inject(:*) }.sort
  end

#OR

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |item_1|
    arr2.each do |item_2|
      products << (item_1 * item_2)
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# 7.10: The End Is Near But Not Here

# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

#input: string
#output: RETURN 2nd to last string

#pseudo: reference string[-2]

def penultimate(string)
 words = string.split
 words[-2]
end
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'