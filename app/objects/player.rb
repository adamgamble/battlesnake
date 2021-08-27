class Player
  def self.build_players_from_board(board)
    snakes = []
    my_id = board[:you][:id]
    board[:board][:snakes].each do |snake|
      snakes << Player.new(snake, my_id)
    end
    snakes
  end

  attr_reader :id, :name, :health, :head, :body, :me

  def initialize snake, me_id
    @id = snake[:id]
    @name = snake[:name]
    @health = snake[:health]
    @head = snake[:head]
    @body = snake[:body]

    @me = me_id == @id
  end
end
