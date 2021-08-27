class Player
  def self.build_players_from_board(board)
    snakes = []
    board[:board][:snakes].each do |snake|
      snakes << Player.new(snake)
    end
    snakes
  end

  attr_reader :id, :name, :health, :head, :body

  def initialize snake
    @id = snake[:id]
    @name = snake[:name]
    @health = snake[:health]
    @head = snake[:head]
    @body = snake[:body]
  end
end
