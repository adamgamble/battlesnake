class Map
  def initialize board
    @map = build_map(board)
    print_map
  end

  def [](x)
    @map[x]
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
    map_array.reverse
  end

  def get_snakes(board)
    my_id = board[:you][:id]
    snakes = board[:board][:snakes]
  end

  def add_objects_to_map(board, map_array)
    snakes = get_snakes(board)
    snakes.each do |snake|
      snake[:body].each do |coordinates|
        map_array[coordinates[:y]][coordinates[:x]] = "|"
      end
      map_array[snake[:head][:y]][snake[:head][:x]] = "H"
    end
    board[:board][:food].each do |coordinates|
      map_array[coordinates[:y]][coordinates[:x]] = ""
    end
    map_array
  end

  def print_map
    str = ""
    @map.each do |row|
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
