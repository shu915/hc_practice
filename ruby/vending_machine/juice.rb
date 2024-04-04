# frozen_string_literal: true

# ジュースのインスタンスを生成するのに使います
class Juice
  def initialize(name, price)
    @name = name
    @price = price
  end

  # attr_readerを使うなと言われたので、定義する
  def name
    @name
  end

  # attr_readerを使うなと言われたので、定義する
  def price
    @price
  end
end
