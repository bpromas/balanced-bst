require_relative "node"

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array, 0, array.size-1)
    end

    def build_tree(arr, start, finish)
        return nil if start > finish

        mid = (start + finish)/2
        
        left = build_tree(arr, start, mid-1)
        right = build_tree(arr, mid+1, finish)

        my_node = Node.new(arr[mid], left, right)

        return my_node
    end

    def insert(value, node = @root)
        return Node.new(value) if node.nil?

        if value < node.value
            node.left = insert(value, node.left)
        else
            node.right = insert(value, node.right)
        end
        return node
    end

    def find(value, node = @root)
        return nil if node == nil
        return node if node.value == value

        if value < node.value
            node = find(value, node.left)
        else
            node = find(value, node.right)
        end
        return node
    end


    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
end