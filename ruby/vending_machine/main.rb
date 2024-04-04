# frozen_string_literal: true

require_relative './vender'

# VenderとSuicaのインスタンスを作る、ジュースのインスタンスはVenderの中で作っている
vender = Vender.new
suica = Suica.new

# 購入すると、購入したログ、suicaの残金、売上が出力される。
vender.buy('ペプシ', suica)

# suicaのチャージ以上の量を買うと、お金が足りないと言われる
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)

# お金をチャージできます
suica.charge_deposit(10_000)

# 在庫が5本なので6本以上買うと在庫切れが確認できます
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)
vender.buy('ペプシ', suica)

# いろはすとモンスターも購入できることを確認する
vender.buy('いろはす', suica)
vender.buy('モンスター', suica)

# 在庫を確認できる
puts vender.stock('ペプシ')
puts vender.stock('モンスター')
puts vender.stock('いろはす')

# 買えるジュースのリストを取得できる、ペプシは在庫切れ
puts vender.can_buy

# 在庫を追加できる、追加した後、在庫と購入可能確認をする
vender.add_stock('ペプシ', 5)
puts vender.stock('ペプシ')
puts vender.can_buy
