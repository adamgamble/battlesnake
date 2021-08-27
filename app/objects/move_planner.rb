class MovePlanner

  def initialize game_object
    @game_object = game_object
  end

  def next_move
    moves = possible_moves
    possible_moves.each do |move|
      puts "------------------"
      puts move.inspect
      puts "------------------"
    end
    moves = rank_moves(moves) 
    move = possible_moves.first.first
    puts "Moving #{move.to_s}"
    move
  end

  def possible_moves
    spaces = @game_object.map.open_spaces_from_coordinates(@game_object.me.head[:x], @game_object.me.head[:y])
    food = spaces.select { |arrow, space| space[:food] }
    open = spaces.select { |arrow, space| space[:open] }
    possible_moves = []
    if food.any?
      possible_food = food.map {|arrow, space| [arrow, space] }
      possible_moves += possible_food
    end
    if open.any?
      possible_open = open.map {|arrow, space| [arrow, space] }
      possible_moves += possible_open.shuffle
    end
    possible_moves.uniq
  end

  def score_moves possible_moves
    # [:left, {:x=>2, :y=>3, :open=>true, :food=>false}]
    possible_moves.each do |possible_move|
      
    end

  end
end
