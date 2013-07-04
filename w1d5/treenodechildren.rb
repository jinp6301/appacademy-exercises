class TreeNode

	attr_accessor :children, :parent_node, :value
	
	def initialize(value, parent_node = nil)
		@value = value
		@parent_node = parent_node
		@children = []
	end

	def add_child=(node_object)
		node_object.parent_node = self
		@children << node_object
	end


	def children
		@children
	end

	def bfs(search)
		visited = []
		visited << self
		until visited.empty?
			last_visited = visited.shift
			if last_visited.value == search
				return last_visited
			end
			if last_visited.children != []
				last_visited.children.each do |child|
					visited << child
				end
			end
		end
	end

	def dfs(search)
		return self if self.value == search
		self.children.each do |child|
			result = child.dfs(search) 
			return result if result
		end
		nil
	end

	def bfsb(&block)
		valid = []
		visited = []
		visited << self
		until visited.empty?
			last_visited = visited.shift
			if block.call(last_visited.value) == true
				valid << last_visited
			end
			if last_visited.children != []
				last_visited.children.each do |child|
					visited << child
				end
			end
		end
		valid
	end

	def dfsb(valid = nil, &block)
		if block.call(self.value)
			valid << self
			return valid
		end
		self.children.each do |child|
			p valid
			p block
			result = child.dfsb(valid, block) 
			return result if result
		end
		nil
	end


end










