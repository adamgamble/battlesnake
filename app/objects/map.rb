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
    open_spaces = []
    food_spaces = []

    down = {x: x, y: y-1, open: false, food: false}
    up = {x: x, y: y+1, open: false, food: false}
    left = {x: x-1, y: y, open: false, food: false}
    right = {x: x+1, y: y, open: false, food: false}

    # Begin down checks
    if is_coordinate_open(down[:x], down[:y])
      down[:open] = true
    end

    if is_coordinate_food(down[:x], down[:y])
      down[:food] = true
    end
    # End down checks
    
    # Begin up checks
    if is_coordinate_open(up[:x], up[:y])
      up[:open] = true
    end

    if is_coordinate_food(up[:x], up[:y])
      up[:food] = true
    end
    # End up checks
    
    # Begin left checks
    if is_coordinate_open(left[:x], left[:y])
      left[:open] = true
    end

    if is_coordinate_food(left[:x], left[:y])
      left[:food] = true
    end
    # End left checks

    # Begin right checks
    if is_coordinate_open(right[:x], right[:y])
      right[:open] = true
    end

    if is_coordinate_food(right[:x], right[:y])
      right[:food] = true
    end
    # End right checks
    {down: down, right: right, up: up, left: left}
  end

  def is_coordinate_open(x,y)
    is_coordinate_block(x,y,OPEN_SPACES)
  end

  def is_coordinate_food(x,y)
    is_coordinate_block(x,y,[""])
  end

  def is_coordinate_block(x,y, blocks=[])
    y = (@map[0].count - y) - 1
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

    if blocks.include?(@map.reverse[y][x])
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
