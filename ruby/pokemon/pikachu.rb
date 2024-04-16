# frozen_string_literal: true

require_relative 'pokemon'

# ポケモンから継承して、独自の攻撃ができるピカチュウクラス
class Pikachu < Pokemon
  def attack
    super
    puts "#{@name}の十万ボルト"
  end
end
