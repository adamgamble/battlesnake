# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
# {:game=>{:id=>"3e793109-83b8-4626-8d1a-58ade3fe2806", :ruleset=>{:name=>"standard", :version=>"v1.0.21", :settings=>{:food_spawn_chance=>15, :minimum_food=>1, :hazard_damage_per_turn=>0, :royale=>{:shrink_every_n_turns=>0}, :squad=>{:allow_body_collisions=>false, :shared_elimination=>false, :shared_health=>false, :shared_length=>false}}}, :timeout=>500}, :turn=>5, :board=>{:height=>11, :width=>11, :snakes=>[{:id=>"gs_GMGHvQYTMDjfdjKRg8MGSxFc", :name=>"Snek", :latency=>"243", :health=>99, :body=>[{:x=>6, :y=>5}, {:x=>5, :y=>5}, {:x=>5, :y=>4}, {:x=>5, :y=>3}], :head=>{:x=>6, :y=>5}, :length=>4, :shout=>"Snek!", :squad=>""}, {:id=>"gs_cPXMXPdDwWWB8p3xfvtyBmdM", :name=>"Test snake", :latency=>"76", :health=>99, :body=>[{:x=>7, :y=>0}, {:x=>8, :y=>0}, {:x=>8, :y=>1}, {:x=>8, :y=>2}], :head=>{:x=>7, :y=>0}, :length=>4, :shout=>"", :squad=>""}], :food=>[{:x=>4, :y=>2}, {:x=>4, :y=>4}, {:x=>3, :y=>9}], :hazards=>[]}, :you=>{:id=>"gs_cPXMXPdDwWWB8p3xfvtyBmdM", :name=>"Test snake", :latency=>"76", :health=>99, :body=>[{:x=>7, :y=>0}, {:x=>8, :y=>0}, {:x=>8, :y=>1}, {:x=>8, :y=>2}], :head=>{:x=>7, :y=>0}, :length=>4, :shout=>"", :squad=>""}}
def move(board)
  puts board

  # Choose a random direction to move in
  possible_moves = ["up", "down", "left", "right"]
  move = possible_moves.sample
  puts build_map(board).inspect
  puts "MOVE: " + move
  { "move": move }
end


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
  map_array
end
