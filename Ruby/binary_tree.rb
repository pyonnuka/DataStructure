class BinaryTree
  class Node
    attr_accessor :data, :left, :right

    def initialize(data, left_link = nil, right_link = nil)
      @data = data
      @left = left_link
      @right = right_link
    end
  end

  attr_accessor :root

  def initialize(*args)
    @root = nil
    args.each do |x|
      insert(x)
    end
  end

  def insert(x)
    if @root.nil?
      @root = Node.new(x)
      return
    end

    create_node(@root, x)
  end

  def show
    show_nodes(@root)
  end

  private

  def create_node(node, x)
    if node.data <= x
      if node.right.nil?
        node.right = Node.new(x)
        return
      end
      create_node(node.right, x)
    else
      if node.left.nil?
        node.left = Node.new(x)
        return
      end
      create_node(node.left, x)
    end
  end

  def show_nodes(node)
    puts node.data
    show_nodes(node.right) unless node.right.nil?
    show_nodes(node.left)  unless node.left.nil?
  end
end

btree = BinaryTree.new(1,2,3)
(10..50).each do |num|
  btree.insert(num)
end
btree.show
