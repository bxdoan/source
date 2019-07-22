# in the code-editor, Ruby treats self as the object in which it is currently
# referred to.
# print self


def iterate_colors(colors)
  arr = []
  colors.each { |c| arr << c}
  return arr
end

# Enumerable - each_with_index
# In this challenge, your task is to complete the skip_animals method that takes
# an animals array and a skip integer and returns an array of all elements except
# first skip number of items as shown in the example below.
def skip_animals_1(animals, skip)
  results = []
  animals.drop(skip).each_with_index do |animal, i|
      results << "#{i+skip}:#{animal}"
  end
  results
end

def skip_animals_2(animals, skip)
  animals[skip..-1]
end

 # this is how ROT13 algorithm works,
def rot13(secret_messages)
  secret_messages.map { |c| c.tr("a-z", "n-za-m") }
end

# reduce interm of series
def sum_terms(n)
  (1..n).map {|x| x**2+1 }.reduce(0,:+) if n >= 0
end


# Ruby Enumerables: 'any', 'all', 'none', and 'find'
def func_any(hash)
    # Check and return true if any key object within the hash is of the type Integer
    # If not found, return false.
    hash.any?{|k, i| k.is_a? Integer}
end

def func_all(hash)
    # Check and return true if all the values within the hash are Integers and are < 10
    # If not all values satisfy this, return false.
    hash.all?{|k, v| v.is_a?(Integer) && v < 10}
end

def func_none(hash)
    # Check and return true if none of the values within the hash are nil
    # If any value contains nil, return false.
    hash.none?{|k, v| v.nil?}
end

def func_find(hash)
    # Check and return the first object that satisfies either of the following properties:
    #   1. There is a [key, value] pair where the key and value are both Integers and the value is < 20
    #   2. There is a [key, value] pair where the key and value are both Strings and the value starts with `a`.
    hash.find do |k, v|
      (k.is_a?(Integer) && v.is_a?(Integer) && v < 20) ||
      (k.is_a?(String) && v.is_a?(String) && v.start_with?('a'))
    end
end

# Enumerable - group_by
# > marks = {"Ramesh":23, "Vivek":40, "Harsh":88, "Mohammad":60}
# > group_by_marks(marks, 30)
# => {"Failed"=>[["Ramesh", 23]], "Passed"=>[["Vivek", 40], ["Harsh", 88], ["Mohammad", 60]]}
def group_by_marks(marks, pass_marks)
    marks.group_by{|key,value| value >= pass_marks ? "Passed" : "Failed"}
end


# Array - Initialization
# Array - Index
def element_at(arr, index)
    # return the element of the Array variable `arr` at the position `index`
    # arr.at(index) # or
    # arr[index]
    arr[index]
end

def inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr` between the start_pos and end_pos (both inclusive)
    arr[start_pos..end_pos]
end

def non_inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr`, start_pos inclusive and end_pos exclusive
    arr[start_pos...end_pos]
end

def start_and_length(arr, start_pos, length)
    # return `length` elements of the Array variable `arr` starting from `start_pos`
    arr[start_pos,end_pos]
end

def neg_pos(arr, index)
        arr[-index]
    # return the element of the array at the position `index` from the end of the list
    # Clue : arr[-index]
end

def first_element(arr)
    arr.first
    # return the first element of the array
    # arr.first
end

def last_element(arr)
    arr.last
    # return the last element of the array
    # arr.last
end

def first_n(arr, n)
    arr.take(n)
    # return the first n elements of the array
end

def drop_n(arr, n)
    arr.drop(n)
    # drop the first n elements of the array and return the rest
end

def end_arr_add(arr, element)
    # Add `element` to the end of the Array variable `arr` and return `arr`
    arr.push element
end

def begin_arr_add(arr, element)
    # Add `element` to the beginning of the Array variable `arr` and return `arr`
    arr.unshift element
end

def index_arr_add(arr, index, element)
    # Add `element` at position `index` to the Array variable `arr` and return `arr`
    arr.insert index, element
end

def index_arr_multiple_add(arr, index)
    # add any two elements to the arr at the index
    arr.insert index, index+1, index+2
end

def end_arr_delete(arr)
  arr.pop
end

def start_arr_delete(arr)
  arr.shift
end

def delete_at_arr(arr, index)
  arr.delete_at(index)
end

def delete_all(arr, val)
  arr.delete(val)
end

def select_arr(arr)
  # select and return all odd numbers from the Array variable `arr`
    arr.select {|n| n % 2 != 0}
end

def reject_arr(arr)
  # reject all elements which are divisible by 3
    arr.reject {|n| n % 3 == 0}
end

def delete_arr(arr)
  # delete all negative elements
    arr.delete_if {|n| n <= 0}
end

def keep_arr(arr)
  # keep all non negative elements ( >= 0)
    arr.keep_if {|n| n >= 0}
end

# Hash - Initialization
def empty_hash
  empty_hash = Hash.new
end

def default_hash
  default_hash = Hash.new(1)
end

def hackerrank
  hackerrank = Hash.new
  hackerrank = {"simmy" => 100, "vivmbbs" => 200}
end

# Hash - Each
def iter_hash(hash)
    # your code here
    hash.each { |key, value| puts key; puts value }
end

# hackerrank.select! {|k,v| k.is_a? Integer}
# hackerrank.select! {|k,v| v.odd?}
# hackerrank[543121] = 100

# Lambdas
# Write a lambda which takes an integer and square it
square      = ->(i){i**2}
# Write a lambda which takes an integer and increment it by 1
plus_one    = ->(i){i+1}

# Write a lambda which takes an integer and multiply it by 2
into_2      = ->(i){i*2}

# Write a lambda which takes two integers and adds them
adder       = ->(x,y){x+y}

# Write a lambda which takes a hash and returns an array of hash values
values_only = ->(h){h.values}


input_number_1 = gets.to_i
input_number_2 = gets.to_i
input_hash = eval(gets)

a = square.(input_number_1); b = plus_one.(input_number_2);c = into_2.(input_number_1);
d = adder.(input_number_1, input_number_2);e = values_only.(input_hash)

p a; p b; p c; p d; p e


# Lazy Evaluation
# input: 5
# output : [2, 3, 5, 7, 11]
require 'prime'

n = gets.to_i
p Prime.each.lazy.select{|x| x == x.to_s.reverse.to_i}.first(n)


# Methods - Keyword Arguments
# > convert_temp(0, input_scale: 'celsius', output_scale: 'kelvin')
# => 273.15
# > convert_temp(0, input_scale: 'celsius', output_scale: 'fahrenheit')
# => 32.0
def convert_temp(temp, input_scale:, output_scale: 'Celsius')
    case input_scale.downcase
    when 'fahrenheit'
        return output_scale == 'kelvin' ?
        ((temp - 32) / 1.8) + 273.15 : (temp - 32) / 1.8
    when 'celsius'
        return output_scale == 'kelvin' ?
        temp + 273.15 : (temp * 1.8) + 32
    when 'kelvin'
        return output_scale == 'celsius' ?
        temp - 273.15 : (temp - 273.15) * 1.8
    end
end
