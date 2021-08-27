# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
def move(board)
  # Choose a random direction to move in
  game_object = GameObject.new(board)
  puts "ME: #{game_object.me.inspect}"
  move = find_open_move(game_object)
  puts "MOVE: " + move
  { "move": move }
end

def find_open_move(game_object)
  possible_moves = ["up", "down", "left", "right"]
  move = possible_moves.sample
end

