# 1. Using #each, add to the method below, such that it takes in an array of names, 
# and returns an array of all names upcased.

kardashians = ["kris", "kim", "kourtney", "khloe", "rob"]
# map

def upcase_names(names)
  upcase_kardashians = []
  names.each do |name|
    upcase_kardashians << name.upcase
  end
  upcase_kardashians
end 

p upcase_names(kardashians)

# should return ["KRIS", "KIM", "KOURTNEY", "KHLOE", "ROB"]






# 2. Using #each, update the method below, such that it takes in an array of names,
# and returns a collection of the names that end in 'ie'

pets = ["Brutus", "Lucky", "Goldie", "Pepper", "Odie"]
# find all

def names_ending_in_ie(names)
 ie_pets = []
 names.each do |name|
  ie_pets << name if name.end_with?('ie')
 end
 ie_pets
end 

p names_ending_in_ie(pets)

# should return an array of ["Goldie", "Odie"]




# 3. Using #each, update the method below, such that it takes in an array of integers,
# and returns the first number that is over 100 when squared. 

nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# find

def first_num_thats_square_is_above_100(nums)
  integer = 0
  nums.each do |num|
    until integer ** 2 > 100
      integer = num
      break
    end
  end
  integer
end 

p first_num_thats_square_is_above_100(nums)

# should return the integer 11