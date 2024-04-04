# frozen_string_literal: true

require_relative './suica'
require_relative './juice'

# 自販機のインスタンスを作ってから使います
class Vender
  def initialize
    @inventory = {
      ペプシ: { juice: Juice.new('ペプシ', 150), quantity: 5 },
      モンスター: { juice: Juice.new('モンスター', 230), quantity: 5 },
      いろはす: { juice: Juice.new('いろはす', 120), quantity: 5 }
    }
    @sales = 0
  end

  # attr_reader使うなと書いてあるので、定義する
  def sales
    @sales
  end

  def stock(name)
    @inventory[name.to_sym][:quantity]
  end

  def can_buy
    puts '以下が購入可能'
    @inventory.map do |_name, value|
      if value[:quantity].positive?
        value[:juice].name
      else
        ''
      end
    end
  end

  def add_stock(name, quantity)
    juice = @inventory[name.to_sym]
    juice[:quantity] += quantity
    puts "#{name}の在庫を#{quantity}本補充しました"
    puts "\n"
  end

  def buy(name, suica)
    juice = @inventory[name.to_sym]
    name = juice[:juice].name
    price = juice[:juice].price
    quantity = juice[:quantity]

    if suica.deposit >= price && quantity.positive?
      increase_sales(price)
      juice[:quantity] -= 1
      puts "#{name}を購入しました。"
      suica.decrease_deposit(price)
      puts "売上が#{sales}円になりました"
      puts "\n"
    elsif quantity.zero?
      puts '在庫が切れているので買えません'
      puts "\n"
    elsif suica.deposit < price
      puts 'お金が足りないので買えません'
      puts "\n"
    end
  end

  def increase_sales(price)
    @sales += price
  end
end
