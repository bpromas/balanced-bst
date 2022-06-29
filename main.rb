require_relative "node"
require_relative "tree"

# Generates a unique number not in the array
# This is to ensure duplicates be avoided so as not to increase complexity
def random_unique_number(arr, range = 1..100)
    my_num = rand(range)
    while arr.include?(my_num)
        my_num = rand(range)
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

if tree.balanced?
    p "The tree is balanced."
else
    p "It is not balanced... Let's fix it, shall we?"
    tree.rebalance
    tree.pretty_print
    p "Much better, is it not?"
end

p "We can look at our tree from many perspectives, such as:"

p "level order:"
p tree.level_order_recursive

p "inorder:"
p tree.inorder

p "preorder:"
p tree.preorder

p "postorder:"
p tree.postorder

p "Now, let's grow our tree."
rand(5..15).times do
    num_to_insert = random_unique_number(my_arr, 101..200)
    tree.insert(num_to_insert)
end

tree.pretty_print

if tree.balanced?
    p "Somehow, it remained balanced."
else
    p "It is not balanced... Bah, growing pains. Let me fix it."
    tree.rebalance
    tree.pretty_print
    p "She grew into a fine specimen, didn't she?"
end

p "Let's have another look:"

p "level order:"
p tree.level_order_recursive

p "inorder:"
p tree.inorder

p "preorder:"
p tree.preorder

p "postorder:"
p tree.postorder