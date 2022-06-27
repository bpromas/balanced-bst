require_relative "node"
require_relative "tree"

# Generates a unique number not in the array
# It was advised that duplicates be avoided so as not to increase complexity
def random_unique_number(arr)
    my_num = rand(1..100)
    while arr.include?(my_num)
        my_num = rand(1..100)
    end
    return my_num
end

my_arr = Array.new(rand(1..15)) { rand(1..100) }.uniq.sort
p "creating Balanced BST with array #{my_arr}..."
tree = Tree.new(my_arr)

num_to_insert = random_unique_number(my_arr)
p "Inserting #{num_to_insert}..."
tree.insert(num_to_insert)
tree.pretty_print

existing_num = my_arr[rand(0..my_arr.size-1)]
p "Finding #{existing_num}"
p tree.find(existing_num)

nonexisting_num = random_unique_number(my_arr)
p "Finding #{nonexisting_num}"
p tree.find(nonexisting_num)

