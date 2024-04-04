# frozen_string_literal: true

require_relative './suica'
require_relative './juice'

# 自販機のインスタンスを作ってから使います
class Vender
  def initialize
    @inventory = [
      { juice: Juice.new('ペプシ', 150), quantity: 5 },
      { juice: Juice.new('モンスター', 230), quantity: 5 },
      { juice: Juice.new('いろはす', 120), quantity: 5 }
  ]
    @sales = 0
  end

  # attr_reader使うなと書いてあるので、定義する
  def sales
    @sales
  end

  def stock(name)
    selected_item = @inventory.find { |item| item[:juice].name == name }
    selected_item ? selected_item[:quantity] : 0
  end

  def can_buy
    puts '以下が購入可能'
    @inventory.map do |item|
      if item[:quantity].positive?
        juice = item[:juice]
        juice.name
      else
        ''
      end
    end
  end

  def add_stock(name, quantity)
    selected_item = @inventory.find { |item| item[:juice].name == name }
    selected_item[:quantity] += quantity
    puts "#{name}の在庫を#{quantity}本補充しました"
    puts "\n"
  end

  def buy(name, suica)
    selected_item = @inventory.find { |item| item[:juice].name == name }
    name = selected_item[:juice].name
    price = selected_item[:juice].price
    quantity = selected_item[:quantity]

    if suica.deposit >= price && quantity.positive?
      increase_sales(price)
      selected_item[:quantity] -= 1
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
