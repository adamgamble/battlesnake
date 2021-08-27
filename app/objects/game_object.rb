# {:game=>{:id=>"3e793109-83b8-4626-8d1a-58ade3fe2806", :ruleset=>{:name=>"standard", :version=>"v1.0.21", :settings=>{:food_spawn_chance=>15, :minimum_food=>1, :hazard_damage_per_turn=>0, :royale=>{:shrink_every_n_turns=>0}, :squad=>{:allow_body_collisions=>false, :shared_elimination=>false, :shared_health=>false, :shared_length=>false}}}, :timeout=>500}, :turn=>5, :board=>{:height=>11, :width=>11, :snakes=>[{:id=>"gs_GMGHvQYTMDjfdjKRg8MGSxFc", :name=>"Snek", :latency=>"243", :health=>99, :body=>[{:x=>6, :y=>5}, {:x=>5, :y=>5}, {:x=>5, :y=>4}, {:x=>5, :y=>3}], :head=>{:x=>6, :y=>5}, :length=>4, :shout=>"Snek!", :squad=>""}, {:id=>"gs_cPXMXPdDwWWB8p3xfvtyBmdM", :name=>"Test snake", :latency=>"76", :health=>99, :body=>[{:x=>7, :y=>0}, {:x=>8, :y=>0}, {:x=>8, :y=>1}, {:x=>8, :y=>2}], :head=>{:x=>7, :y=>0}, :length=>4, :shout=>"", :squad=>""}], :food=>[{:x=>4, :y=>2}, {:x=>4, :y=>4}, {:x=>3, :y=>9}], :hazards=>[]}, :you=>{:id=>"gs_cPXMXPdDwWWB8p3xfvtyBmdM", :name=>"Test snake", :latency=>"76", :health=>99, :body=>[{:x=>7, :y=>0}, {:x=>8, :y=>0}, {:x=>8, :y=>1}, {:x=>8, :y=>2}], :head=>{:x=>7, :y=>0}, :length=>4, :shout=>"", :squad=>""}}
class GameObject
  attr_reader :me, :map, :board, :players, :opponents
  def initialize board
    @board = board
    @map = Map.new(board)
    @players = Player.build_players_from_board(board)
    @me = @players.detect {|player| player.me }
    @opponents = @players
    @opponents.delete(@me)
    @move_planner = MovePlanner.new(self)
    puts "----------------------------"
    puts "My head: #{@me.head[:x]},#{@me.head[:y]}"
    @opponents.each do |opponent|
      puts "#{opponent.name} head: #{opponent.head[:x]},#{opponent.head[:y]}"
    end
    puts "----------------------------"
  end

  def map
    @map
  end

  def next_move
    @move_planner.next_move
  end
end
