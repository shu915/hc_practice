# frozen_string_literal: true

require_relative 'player'
require_relative 'pikachu'

# プレイヤーを生成して、モジュールによる名前変更を確認できることを確認する
player = Player.new('山田')
puts player.name
player.change_name('山本')
puts player.name

# ピカチュウを、ポケモンから継承したピカチュウクラスから生成して、
# 攻撃によって、個別の攻撃ができることを確認する
# 名前をモジュールによる変更機能を使って変更できることを確認する
pika = Pikachu.new('ピカチュウ', '電気', '', 100)
pika.attack
pika.change_name('ライチュウ')
puts pika.name
pika.attack
