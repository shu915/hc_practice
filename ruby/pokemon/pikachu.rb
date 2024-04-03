require_relative 'pokemon'

class Pikachu < Pokemon
  def attack
    super
    puts "#{@name}の十万ボルト"
  end
end

