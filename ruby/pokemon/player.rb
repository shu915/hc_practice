require_relative 'name_service'

class Player
  include NameService

  def initialize(name)
    @name = name
  end
end

player = Player.new('山田')
puts player.get_name;
player.change_name('山本')
puts player.get_name;
