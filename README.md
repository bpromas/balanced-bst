This repository was created as part of The Odin Project's curriculum.

This was part of my study on data structures, where I created a balanced binary search tree, alongside many methods for manipulating and traversing the tree.

The methods created for the Tree class are as follows:

**build_tree:** Builds the tree from a sorted array of numbers. **Note:** None of this was ever tested with duplicate numbers, as per the curriculum's specifications.

**insert:** Takes an integer argument and inserts a new node to the tree with that value.

**delete:** Takes an integer argument and removes a node from the tree with that value. By far the method that made my head hurt the most.

**find:** Takes an integer argument and returns a node with that value.

**level_order:** Traverses the tree in [level order](https://www.guru99.com/tree-traversals-inorder-preorder-and-postorder.html#3), if given a block, yields each node as it is visited, if not, simply returns an array sorted in order of visits.

**inorder:** Traverses the tree in [inorder traversal](https://www.guru99.com/tree-traversals-inorder-preorder-and-postorder.html#4), if given a block, yields each node as it is visited, if not, simply returns an array sorted in order of visits.

**preorder:** Traverses the tree in [preorder traversal](https://www.guru99.com/tree-traversals-inorder-preorder-and-postorder.html#6), if given a block, yields each node as it is visited, if not, simply returns an array sorted in order of visits.

**postorder:** [guess](https://www.guru99.com/tree-traversals-inorder-preorder-and-postorder.html#5).

**height:** Returns the height of a given node, in other words, how far away it is from the farthest leaf.

**depth:** Returns the depth of a given node, in other words, how far away it is from the root.

**balanced?:** Checks if the tree is balanced, meaning that the difference between the **heights** of the left and right nodes of every subtree must not be more than 1. Still not 100% sure how it works, but it does.

**rebalance:** One liner: `@root = build_tree(self.inorder)`. Rebalances the tree. Simply call **inorder** to get an array of sorted node values, and **build_tree** passing that array.

**find_minimum:** Finds the smallest value node by simply going left until you can't go left anymore. Useful for **delete**.

**find_maximum:** Finds the largest value node by simply going right until you can't go right anymore. Not useful.

**pretty_print:** Prints out the tree in a super readable way. Amazing. I didn't make this. It was provided by an unspecified student of The Odin Project.

Other than that there's the Node class with a seldom used **is_leaf?** method, and the main.rb file, used as a driver script to run some example methods, and extensively during testing. Also a cute **random_unique_number** method to avoid generating duplicate numbers for insertions. It can technically enter an infinite loop if there are no unique numbers in the given range, which I didn't bother preventing.
