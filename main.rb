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
root_value = my_arr[(my_arr.size-1)/2]
p "creating Balanced BST with array #{my_arr}..."
tree = Tree.new(my_arr)

num_to_insert = random_unique_number(my_arr)
p "Inserting #{num_to_insert}..."
tree.insert(num_to_insert)
tree.pretty_print

existing_num = my_arr[rand(0..my_arr.size-1)]
p "Finding #{existing_num}"
p tree.find(existing_num)
p "Deleting #{existing_num}"
tree.delete(existing_num)
tree.pretty_print

p "level order:"
p tree.level_order_recursive
order2 = []
tree.level_order_recursive { |node| order2 << node.value * 2}
p order2

p "inorder:"
p tree.inorder
order2 = []
tree.inorder { |node| order2 << node.value * 2}
p order2

p "preorder:"
p tree.preorder
order2 = []
tree.preorder { |node| order2 << node.value * 2}
p order2

p "postorder:"
p tree.postorder
order2 = []
tree.postorder { |node| order2 << node.value * 2}
p order2

