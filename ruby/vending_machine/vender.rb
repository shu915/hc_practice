require_relative './suica'
require_relative './juice'

class Vender
  def initialize
    @inventory = {
      ペプシ: { juice: Juice.new('ペプシ', 150), quantity: 5},
      モンスター: { juice: Juice.new('モンスター', 230), quantity: 5},
      いろはす: { juice: Juice.new('いろはす', 120), quantity: 5},
  }
    @sales = 0
  end

  def get_sales
    @sales
  end

  def get_stock(name)
    @inventory[name.to_sym][:quantity]
  end

  def get_can_buy
    puts '以下が購入可能'
    @inventory.map do |name,value|
      if value[:quantity] > 0
        value[:juice].get_name
      else
        ''
      end
    end
  end

  def add_stock(name, quantity)
    juice = @inventory[name.to_sym]
    juice[:quantity] += quantity
    puts "#{name}の在庫を#{quantity}本補充しました"
  end

  def buy(name, suica)
    juice = @inventory[name.to_sym]
    name = juice[:juice].get_name
    price = juice[:juice].get_price

    if suica.get_deposit >= juice[:juice].get_price && juice[:quantity] > 0
    increase_sales(price)
    juice[:quantity] -= 1
    puts "#{juice[:juice].get_name}を購入しました。"
    puts "売上が#{get_sales}円になりました"
    suica.decrease_deposit(price)
    elsif juice[:quantity] == 0
      puts "在庫が切れているので買えません"
    elsif suica.get_deposit < price
      puts "お金が足りないので買えません"
    end
  end

  def increase_sales(price)
    @sales += price
  end
end

vender = Vender.new
suica = Suica.new

vender.buy('ペプシ', suica)
suica.charge_deposit(10000)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('いろはす', suica)
vender.buy('モンスター', suica)
vender.buy('いろはす', suica)
vender.buy('モンスター', suica)

puts vender.get_stock('ペプシ')
puts vender.get_stock('モンスター')
puts vender.get_stock('いろはす')
puts vender.get_can_buy

# vender.add_stock('ペプシ', 5)

puts vender.get_stock('ペプシ')
puts vender.get_stock('モンスター')
puts vender.get_stock('いろはす')
puts vender.get_can_buy
