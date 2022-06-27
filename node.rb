require_relative "tree"

class Node
    attr_accessor :value, :left, :right
    def initialize(value, left=nil, right=nil)
        @value = value
        @left = left
        @right = right
    end

    def is_leaf?
        return self.right.nil? && self.left.nil?
    end
end