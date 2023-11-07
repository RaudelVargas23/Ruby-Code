require_relative 'binary_search_tree'
require_relative 'tree_node'

# Define a menu to display available options to the user.
def menu
  puts "Menu Options :"
  puts "X,Y,Z,A,R,S,U,I,C,L"
  puts "Press Q To Quit "
end
# add values to a BST
def add_values(tree)
  puts "Enter a list of comma seperated values to be input into the Binary Search Tree  (NO SPACES PLEASE)"
  input = gets.chomp
  numbers = input.split(",")
  #  array of strings to  array of Float
  numbers_array = numbers.map(&:to_f)
  if tree.root.nil? == true
    #add values
    numbers_array.each { |value|
      tree.insert(value)
    }
  elsif tree.root.nil? == false
    #clear tree then add values
    tree.delete_tree
    numbers_array.each { |value|
      tree.insert(value)
    }
  end
end
# insert a single value into a BST
def insert_value(tree,value)
  tree.insert(value.to_i)
end
#Set Y takes the content of X; set Z takes the content of Y; and set X
# takes the previous content of Z.
def rotate_trees(tree_x,tree_y,tree_z)
  temp_x = tree_x.root
  temp_y = tree_y.root
  temp_z = tree_z.root

  tree_x.root = temp_y
  tree_y.root = temp_z
  tree_z.root = temp_x
end
# switch the content of two trees (X and Y)
def switch_trees(tree_x,tree_y)
  temp_x = tree_x.root
  temp_y = tree_y.root

  tree_x.root = temp_y
  tree_y.root = temp_x
end


# union operation between two trees (merge Y into X)
def union(tree_x,node)
  if node.nil?
    return
  end
  union(tree_x,node.left)
  tree_x.insert(node.value)
  union(tree_x,node.right)
end

def inter_recursive(node_x,node_y)
  if node_x.nil? || node_y.nil?
    return
  end

  if node_x.value == node_y.value
    new_node = TreeNode.new(node_x.value)
    new_node.left = inter_recursive(node_x.left, node_y.left)
    new_node.right = inter_recursive(node_x.right, node_y.right)
    return new_node
  elsif node_x.value < node_y.value
    return inter_recursive(node_x.right, node_y)
  else
    return inter_recursive(node_x, node_y.right)
  end

end

# intersection operation between two trees
def intersection(tree_x,tree_y)
  tree_x.root = inter_recursive(tree_x.root,tree_y.root)
end


# execute a lambda expression on each node in the tree
def lambda_execution(node,lambda_string)
  if node.nil?
    return
  end

  lambda_execution(node.left,lambda_string)

  output = lambda_string.call(node.value)

  puts "Node Value #{node.value}: "
  puts "After Lambda #{output}"

  lambda_execution(node.right,lambda_string)

end
# print the inorder traversal of the three BST
def print_trees(tree_x,tree_y,tree_z)
  puts ""
  puts ""
  puts "Inorder traversal of BSTX: "
  tree_x.inorder
  puts ""
  puts ""
  puts "Inorder traversal of BSTY: "
  tree_y.inorder
  puts ""
  puts ""
  puts "Inorder traversal of BSTZ: "
  tree_z.inorder
  puts ""
  puts ""
end

# Main()
#creates the 3 trees
tree_x = BinarySearchTree.new
tree_y = BinarySearchTree.new
tree_z = BinarySearchTree.new

# print the menu
menu
user_input = gets.chomp

# Main loop to process user input
while user_input != 'q'

  case user_input
  when "x"
    add_values(tree_x)
  when "y"
    add_values(tree_y)
  when "z"
    add_values(tree_z)
  when "a"
    puts "Enter Value To Be Inserted Into Set X"
    input = gets.chomp
    insert_value(tree_x,input)
  when "r"
    puts "Set Y will take the content of X Set Z takes the content of Y; and Set X takes the previous content of Z."
    rotate_trees(tree_x,tree_y,tree_z)
  when "s"
    puts "The contents of sets X and Y are switched"
    switch_trees(tree_x,tree_y)
  when "u"
    puts "This command takes the union of sets X and Y. The result set is stored as X"
    union(tree_x,tree_y.root)
  when "i"
    puts "This command takes the intersection of sets X and Y. The result set is stored as X."
    intersection(tree_x,tree_y)
  when "c"
    puts "Set X is deep copied into set Y. The previous content of Y is lost"
    tree_x.copy_rec(tree_y)
  when "l"
    puts "lambda is applied to every element of set X. The result of each lambda execution is output on your console."
    puts " Set X is not modified."

    puts "Enter Lambda Expression"
    lambda_express = gets.chomp
    eval_lambda = eval lambda_express
    lambda_execution(tree_x.root,eval_lambda)
  else
    puts "Input is not recognized"
  end
  # print the menu
  print_trees(tree_x,tree_y,tree_z)

  menu
  user_input = gets.chomp
end
print_trees(tree_x,tree_y,tree_z)



