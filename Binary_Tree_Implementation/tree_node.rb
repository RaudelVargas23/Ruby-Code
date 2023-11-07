# frozen_string_literal: true

class TreeNode

  # These attributes represent the left and right children of the TreeNode.
  # as well as the  getting and setting the value of the TreeNode
  attr_accessor :value, :left, :right

  # The constructor method initializes a new TreeNode with a given value.
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end
