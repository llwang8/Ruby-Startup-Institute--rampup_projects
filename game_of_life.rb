#work in process, to be finalized 11/5/2015

#Life was invented by the mathematician John Conway in 1970.
#Life is just one example of a cellular automaton, which is any system 
#in which rules are applied to cells and their neighbors in a regular grid.

#Rules:
#1. A dead cell with exactly three live neighbors becomes a live cell (birth).
#2. A live cell with two or three live neighbors stays alive (survival).
#3. In all other cases, a cell dies or remains dead (overcrowding or loneliness).

#The number of live neighbors is always based on the cells before the rule was applied. 
#Some of the most common objects in Life remain the same from step to step. No live cells 
#die and no new cells are born. For an object to be a still life, every live cell most 
#have 2 or 3 live neighbors, and every dead cell may have any number of neighbors except 3.

class Cell
    attr_accessor :state, :position_x, :position_y, :live_count
    def initialize(state="X", position_x, position_y)
        @state = state
        @position_x = position_x
        @position_y = position_y
        @live_count = 0
        
    end    
end

class GameOfLife
    attr_accessor :grid, :m_grid, :n_generation, :init_position_array
    
    def initialize (m, n, init_position_array)
        @m_grid = m_grid
        #initialize m grid
        @grid = Array.new(m_grid) {Array.new(m_grid)}
        grid.each do |i|
            grid[i].each do |j|
               grid [i][j] = Cell.new("X", i, j)
            end
        end
        
        @init_position_array = init_position_array
        
        #set_init_live_position 
        init_position_array.each {|position| grid[position[0]][position[1]].state = "O"} 
        
        @n_generation = n_generation
        while n_generation > 0
            update_live_position
            next_generation
            output_state
        end
    end
    
    def update_live_position
        
        
    end
    
    def next_generation
        grid.each do |i|
            grid[i].each do |j| 
                if grid[i][j].live_count == 3 || grid[i][j].live_count == 2
                    grid[i][j].state = "O" 
                else
                    grid[i][j].state = "X"
                end
            end
        end
    end
    
    def output_state
        grid.each do |i|
            str = ""
            grid[i].each do |j|
                str = str + grid[i][j].state
                puts str
            end
        end
    end
    
end

GameOfLife.new



        