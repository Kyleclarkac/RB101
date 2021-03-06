# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

#check all substrings of a input string to see if they are palendromes 
#if a substring is a palendrome add it to a new array. 
#return the new array with all substring palendromes. 

def palendrome_substrings(string)
  new_arr = []
  all_substrings(string).each do |substring|
    if palendrome?(substring)
      new_arr << substring
    end
  end
  return new_arr
end

def all_substrings(string)
  arr = []
  string.each_char.with_index do |str, idx|
    following = idx + 1
    current = str
    while following < string.length && idx < string.length - 1
      current += string[following]
      following +=1
      arr << current
    end
  end
  arr
end

def palendrome?(string)
  string == string.reverse 
end

p all_substrings("hello")

p palendrome?("aaa")

p palendrome_substrings("which of these are racecars?")

