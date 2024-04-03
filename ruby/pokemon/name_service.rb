# frozen_string_literal: true

# プレイヤーとポケモンで共有する、名前を変えたり、取得したりするモジュール
module NameService
  def change_name(name)
    if name == 'うんこ'
      puts '不適切名前です'
      exit
    end
    @name = name
  end

  def name
    @name
  end
end
