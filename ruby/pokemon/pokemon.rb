# frozen_string_literal: true

# ポケモンのクラス、名前やタイプ、hpを持ち、攻撃ができる
class Pokemon
  include NameService

  def initialize(name, type1, type2, hp = 100)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{@name}のこうげき!"
  end
end
