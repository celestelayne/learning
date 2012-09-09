class Maze
  attr_accessor :start, :size, :target, :walls
  
  def initialize()
    @size = {x: 10, y: 10}
    
    @target = {x: 0, y: 1}
    @start = {x: 0, y: 0}
    
    @walls = [{{x: 0, y:0} => {x:0, y:1}, {x: 0, y:1} => {x:0, y:0}}] # illegal moves.
    
   end
end

maze_guy = Maze.new

class Traverse_Maze_Guy
  attr_accessor :maze, :current_position, :next_position, :path, :visited_moves
  
  def initialize(maze)
    @maze = maze
    @current_position = maze.start
    @next_position = {}
    
    @visited_moves = []
    @path = []
  end
  
  def traverse
    # Where the magic happens
    self.path << self.current_position
    self.visited_moves << self.current_position
    
    while self.current_position != self.maze.target
      
      possible_moves = self.possible_moves #method
      if possible_moves.length == 0
        puts "You're turning around !"
        self.path.pop()
        self.current_position = self.path.last
        self.possible_moves
      else 
        self.path << possible_moves[0]
        self.visited_moves << possible_moves[0]
        self.current_position = possible_moves[0]
      end
      p self.path
    end

  end
  
  def deltas
    array_of_possibilities = []
    array_of_possibilities << {x:1, y:0}
    array_of_possibilities << {x:0, y:1}
    array_of_possibilities << {x:-1, y:0}
    array_of_possibilities << {x:0, y:-1}
    return array_of_possibilities
  end
  
  def possible_moves
    possible_moves = []
    for delta in self.deltas
      next_move = {x:self.current_position[:x] + delta[:x], y:self.current_position[:y] + delta[:y]}
      if ((next_move[:x] >= 0) and (next_move[:x] < self.maze.size[:x])) and ((next_move[:y] >= 0) and (next_move[:y] < self.maze.size[:y]))
        if !self.visited_moves.include?(next_move)
          jump = {self.current_position => next_move}
          if !(self.maze.walls.include?(jump))
            possible_moves << next_move
          end
        end
      end
    end 
  
    
    return possible_moves
  end  
  
  
end 

pacman_guy = Traverse_Maze_Guy.new(maze_guy)
pacman_guy.traverse