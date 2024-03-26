# frozen_string_literal: true

class Suica
  def initialize
    @deposit = 500
  end

  def get_deposit
    @deposit
  end

  def decrease_deposit(yen)
    @deposit -= yen
    puts "#{yen}円引かれて、残高は#{@deposit}円になりました。"
  end

  def charge_deposit(yen)
    if yen < 100
      puts "100円以上から、任意にチャージできます"
      exit
    end
    @deposit += yen
    puts "#{yen}円チャージして、#{@deposit}円になりました"
  end
end
