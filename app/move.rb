# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
def move(board)
  # Choose a random direction to move in
  game_object = GameObject.new(board)
  move = game_object.next_move
  { "move": move }
end

