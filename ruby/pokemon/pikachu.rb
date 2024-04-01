require_relative 'pokemon'

class Pikachu < Pokemon
  def attack
    super
    puts "#{@name}の十万ボルト"
  end
end
pika = Pikachu.new('ピカチュウ', '電気', '', 100)
pika.attack
pika.change_name('ライチュウ')
puts pika.get_name
pika.attack
