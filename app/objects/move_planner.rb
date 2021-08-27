class MovePlanner

  def initialize game_object
    @game_object = game_object
  end

  def next_move
    spaces = @game_object.map.open_spaces_from_coordinates(@game_object.me.head[:x], @game_object.me.head[:y])
    food = spaces.select { |arrow, space| space[:food] }
    open = spaces.select { |arrow, space| space[:open] }
    possible_moves = []
    if food.any?
      food.each do |arrow, space|
        next_spaces = @game_object.map.open_spaces_from_coordinates(space[:x], space[:y])
        space[:next_move_count] = next_spaces.keys.count
      end
      possible_food = food.map {|arrow, space| [arrow, space[:next_move_count]]}
      possible_food.sort! {|a,b| b.last <=> a.last}
      possible_moves += possible_food
    else
      open.each do |arrow, space|
        next_spaces = @game_object.map.open_spaces_from_coordinates(space[:x], space[:y])
        space[:next_move_count] = next_spaces.keys.count
      end
      possible_open = open.map {|arrow, space| [arrow, space[:next_move_count]]}
      possible_moves += possible_open
    end
    possible_moves.uniq!
    possible_moves.sort! {|a,b| b.last <=> a.last}
    puts "Possible Moves: #{possible_moves.map(&:first).join(",")}"
    move = possible_moves.first.first
    puts "Moving #{move.to_s}"
    move
  end
end
