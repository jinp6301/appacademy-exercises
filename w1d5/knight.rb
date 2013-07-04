class KnightPathFinder

	attr_accessor :location, :next_moves, :last_move, :visited
	
	def initialize(location, last_move = nil)
		@location = location
		@last_move = last_move
		@next_moves = []
		@visited = []
	end

	def add_move=(location_object)
		location_object.last_move = self
		@next_moves << location_object
		if self.visited.empty?
			location_object.visited << self.location
		else
			self.visited.each do |visited|
				location_object.visited << visited
			end
			location_object.visited << self.location
		end
	end

	def next_moves
		@next_moves
	end

	def build_move_tree
		knight_moves = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
		knight_moves.each do |move|
			x = self.location[0] + move[0]
			y = self.location[1] + move[1]
			if (0..7).include? x
				if (0..7).include? y
					if self.visited.include?([x,y]) == false
						self.add_move=(KnightPathFinder.new([x, y]))
					end
				end
			end
		end
	end

	def find_path(target_pos)
		if target_pos == self.location
			return self.location
		else
			found = []
			until found.last == target_pos
				self.build_move_tree
				self.next_moves.each do |moves|
					if moves.location == target_pos
						found = moves.visited
						return found
					end
				end
				for next_moves.

			end
			return "fail"
		end
	end

	def find_path1(target_pos)
		if target_pos == self.location
			return self.location
		else
			found = []
			until found == target_pos
				self.build_move_tree
				found = self.bfsb(target_pos)
			end
			return found.visited
		end
	end

	def bfsb(location)
		valid = []
		visited1 = []
		visited1 << self
		until visited1.empty?
			last_visited = visited1.shift
			if last_visited.location == true
				valid << last_visited
			end
			if last_visited.next_moves != []
				last_visited.next_moves.each do |child|
					visited1 << child
				end
			end
		end
		valid
	end

end