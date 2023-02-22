# Given the following array:
nested_animals = [[:dog, :cat, :zebra], [:quokka, :unicorn, :bear]]

# Use an enumerable to:
# 1. Return an unnested (single layer) array of animals as strings

# string_animals = []

# nested_animals.each do |array|
#   array.each do |animal|
#     string_animals << animal.to_s
#   end
# end

string_animals = nested_animals.flatten.map do |animal|
  animal.to_s
end

# p string_animals


# 2. Return an unnested array of animals with length >= 4

string_animals = []

nested_animals.flatten.each do |animal|
    string_animals << animal.to_s if animal.length >= 4
end

# p string_animals



# 3. Return a hash where the keys are the animal, and the values are the length. ex: {dog: 3, cat: 3, zebra: 5 ... }

string_animals = {}

nested_animals.each do |array|
  array.each do |animal|
    string_animals[animal] = animal.length
  end
end

p string_animals

# can we change hash so that it prints out the way that the example is?