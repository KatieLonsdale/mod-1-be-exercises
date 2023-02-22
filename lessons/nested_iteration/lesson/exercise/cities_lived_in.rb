


# Problem #1: 
# Get a unique list of all of the cities that these humans have lived in  
# ["Philadelphia", "Fort Collins", "Seattle", "Denver", "Santa Fe", "Portland", "Lansing", "Columbus", "Austin"]

# cities = []
# cities_lived_in.each_value do |value|
#     value.each do |city|
#         unless cities.include?(city)
#             cities << city
#         end
#     end
# end

# p cities




# Problem #2: 
# Write code that iterates through the `cities_lived_in` hash, and returns a list of  
# names of the humans who've lived in Philadelphia.

# [:michaela, :mike, :salvador]
# or
# ["Michaela", "Mike", "Salvador"]

# people = []

# cities_lived_in.each do |name, cities|
#     if cities.include?('Philadelphia')
#         people << name
#     end
# end

# p people



cities_lived_in = {
    michaela: ["Philadelphia", "Fort Collins", "Seattle"],
    mike: ["Denver", "Santa Fe", "Philadelphia", "Portland"],
    pamela: ["Lansing"],
    alex: ["Seattle", "Columbus", "Philadelphia", "Austin"]
}

hash = {}
cities = []
cities_lived_in.each_value do |value|
    value.each do |city|
        cities << city
        hash[city] = cities.count(city)
    end
end

p hash

# Problem #3: 
# Create a hash that has the city as a key, and the number of people that live in it as it's value: 

# {
#     "Philadelphia" => 3,
#     "Fort Collins" => 1,
#     "Seattle" =>2,
#     "Denver" => 1,
#     "Santa Fe" => 1,
#     "Portland" => 1,
#     "Lansing" => 1,
#     "Columbus => 1,
#     "Austin" => 1
# }
