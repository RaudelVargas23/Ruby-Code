# frozen_string_literal: true

class BinarySearchTree
    # The root of the binary search tree.
    attr_accessor :root
    # Initializes a new empty BinarySearchTree
    def initialize
      @root = nil
    end
    # Inserts a new value into the BST
    def insert(value)
      @root = insert_rec(@root, value)
    end
    # Performs an inorder traversal of the BST
    def inorder
      inorder_rec(@root)
    end
    # Deletes the entire tree recursively and sets the root to nil
    def delete_tree
      delete_tree_rec(@root)
      @root = nil
    end
    # Copies the current tree into another tree
    def copy_rec(tree)
      tree.root = deep_copy(@root)
    end

    private
    # Recursively inserts a value into the BST
    def insert_rec(node, value)
      if node.nil?
        return TreeNode.new(value)
      end

      if  value < node.value
        node.left = insert_rec(node.left, value)
      elsif value > node.value
        node.right = insert_rec(node.right, value)
      else
        #do nothing if values are the same
        # do not insert
      end
      return node
    end
    # Recursively performs an inorder traversal and prints
    def inorder_rec(node)
      if node.nil?
        return
      end

      inorder_rec(node.left)
      print node.value.to_s + " "#this shouldnt chnage the node datatype
      inorder_rec(node.right)
    end


    # Recursively deletes the tree
    def delete_tree_rec(node)
      if node.nil?
        return
      end
      delete_tree_rec(node.left)
      delete_tree_rec(node.right)
      node.left = nil
      node.right = nil
    end
    # Deep copies the current tree
    def deep_copy(node)
      if node.nil?
        return nil
      end
      new_node = TreeNode.new(node.value)
      new_node.left = deep_copy(node.left)
      new_node.right = deep_copy(node.right)

      return new_node
    end
  end#BSTtree

