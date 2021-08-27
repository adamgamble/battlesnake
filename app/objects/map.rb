class Map
  OPEN_SPACES = [[], ""]
  def initialize board
    @map = build_map(board)
    @blocked_array = []
    print_map
  end

  def [](x)
    @map[x]
  end


  def get_field(x, y)
    @map[x-1][y-1]
  end

  # Determine if up, down, left, or right is open from a given space
  def open_spaces_from_coordinates(x,y)
    open_spaces = [:up, :down, :left, :right]

    puts "Checking #{x},#{y} for open moves"
    # Begin down checks
    puts "Down is #{x},#{y-1}"
    if !is_coordinate_open(x, y - 1)
      puts "Down #{x},#{y-1} is not open"
      open_spaces.delete(:down)
    end
    # End up checks
    
    # Begin up checks
    puts "Up is #{x},#{y+1}"
    if !is_coordinate_open(x, y + 1)
      puts "Up #{x},#{y+1} is not open"
      open_spaces.delete(:up)
    end
    # End down checks
    
    # Begin left checks
    puts "Left is #{x-1},#{y}"
    if !is_coordinate_open(x - 1, y)
      puts "Left #{x-1},#{y} is not open"
      open_spaces.delete(:left)
    end
    # End left checks

    # Begin right checks
    puts "Right is #{x+1},#{y}"
    if !is_coordinate_open(x + 1, y)
      puts "Right #{x+1},#{y} is not open"
      open_spaces.delete(:right)
    end
    # End right checks
    
    open_spaces
  end

  def is_coordinate_open(x,y)
    y = (@map[0].count - y) - 1
    puts "Checking array at #{x}, #{y}"
    if x < 0
      return false
    end

    if x > @map.count - 1
      return false
    end

    if y < 0
      return false
    end
    
    if y > @map[0].count - 1
      return false
    end
    puts "Checking array at #{x}, #{y} got #{@map.reverse[y][x]}"

    if OPEN_SPACES.include?(@map.reverse[y][x])
      return true
    else
      return false
    end
  end

  private
  def build_map(board)
    map_array = []
    height = board[:board][:height]
    width = board[:board][:width]
    width.times do
      x_array = []
      height.times do
        x_array << []
      end
      map_array << x_array
    end
    map_array = add_objects_to_map(board,map_array)
    map_array
  end

  def get_snakes(board)
    my_id = board[:you][:id]
    snakes = board[:board][:snakes]
  end

  def add_objects_to_map(board, map_array)
    snakes = get_snakes(board)
    snakes.each do |snake|
      snake[:body].each do |coordinates|
        map_array[coordinates[:y]][coordinates[:x]] = "█"
      end
      head_char = board[:you][:id] == snake[:id] ? "M" : "H"
      map_array[snake[:head][:y]][snake[:head][:x]] = head_char
    end
    board[:board][:food].each do |coordinates|
      map_array[coordinates[:y]][coordinates[:x]] = ""
    end
    map_array
  end

  def print_map
    str = ""
    @map.reverse.each do |row|
      row.each do |column|
        if column == []
          str << "."
        else
          str << column[0]
        end
      end
      str << "\n"
    end
    puts str
  end
end
