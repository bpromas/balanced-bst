require_relative "node"

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array, 0, array.size-1)
    end

    def build_tree(arr, start, finish)
        return if start > finish

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

    # TO-DO fix deletions of the root node when root node has only one child
    def delete(value, node = @root)
        return if node == nil

        if value < node.value
            node.left = delete(value, node.left)
            return node
        elsif value > node.value
            node.right = delete(value, node.right)
            return node
        else # value == node.value
            if node.is_leaf? 
                return nil
            elsif node.left.nil?
                # has only right node
                return node.right
            elsif node.right.nil?
                # has only left node
                return node.left
            else
                # has two nodes
                temp_node = find_minimum(node.right)
                delete(temp_node.value)
                node.value = temp_node.value
                return node
            end
        end
    end

    def find(value, node = @root)
        return if node == nil
        return node if node.value == value

        if value < node.value
            node = find(value, node.left)
        else
            node = find(value, node.right)
        end
        return node
    end

    def level_order
        return if @root.nil?
        queue = []
        result = []
        queue.push(@root)
        until queue.size == 0
            node = queue.shift #dequeue
            result << node.value
            queue.push(node.left) unless node.left.nil?
            queue.push(node.right) unless node.right.nil?
            yield(node) if block_given?
        end

        return result unless block_given?
    end

    def level_order_recursive(queue = [@root], result = [], &block)
        return if queue.size == 0
        node = queue.shift
        yield(node) if block_given?
        result << node.value unless block_given?
        queue.push(node.left) unless node.left.nil?
        queue.push(node.right) unless node.right.nil?
        level_order_recursive(queue, result, &block)
        return result unless block_given?
    end

    #LNR
    def inorder(node = @root, result = [], &block)
        inorder(node.left, result, &block) unless node.left.nil?
        result << node.value
        yield(node) if block_given?
        inorder(node.right, result, &block) unless node.right.nil?
        return result unless block_given?
    end

    #NLR
    def preorder(node = @root, result = [], &block)
        result << node.value
        yield(node) if block_given?
        preorder(node.left, result, &block) unless node.left.nil?
        preorder(node.right, result, &block) unless node.right.nil?
        return result unless block_given?
    end

    #LRN
    def postorder(node = @root, result = [], &block)
        postorder(node.left, result, &block) unless node.left.nil?
        postorder(node.right, result, &block) unless node.right.nil?
        result << node.value
        if block_given?
            yield(node) 
        else
            return result unless block_given?
        end
    end

    def find_minimum(node)
        until node.left.nil?
            node = node.left
        end
        return node
    end

    def find_maximum(node)
        until node.right.nil?
            node = node.right
        end
        return node
    end


    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
end