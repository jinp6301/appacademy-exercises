class TreeNode

	attr_accessor :left_node, :right_node, :parent_node, :value
	
	def initialize(value, parent_node = nil)
		@value = value
		@parent_node = parent_node
		@left_node = nil
		@right_node = nil

	end

	def add_child=(node_object)
		if

	def right=(node_object)
		if self.right == nil
			@right_node = node_object
			@right_node.parent_node = self
		else
			@right_node.parent_node = nil
		end
	end

	def left=(node_object)
		if self.left == nil
			@left_node = node_object
			@left_node.parent_node = self
		else
			@left_node.parent_node = nil
		end
	end

	def left
		@left_node
	end

	def right
		@right_node
	end

	def bfs(search)
		visited = []
		visited << self
		until visited.empty?
			last_visited = visited.shift
			if last_visited.value == search
				return last_visited
			end
			if last_visited.left != nil
				visited << last_visited.left
			end
			if last_visited.right != nil
				visited << last_visited.right
			end
		end
	end

	def dfs(search)
		result = nil
		if self.value == search
			result = self
			return result
		elsif self.left == nil && self.right == nil
			return result
		else
			if self.left != nil
				result = self.left.dfs(search)
			end
			result = self.right.dfs(search) unless result
			return result
		end
	end


end