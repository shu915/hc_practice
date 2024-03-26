# frozen_string_literal: true

def calc_golf_score(pars, player_score)
  result = []

  18.times do |index|
    if player_score[index] + 4 == pars[index]
      result << 'コンドル'
    elsif player_score[index] == 1
      result << 'ホールインワン'
    elsif player_score[index] + 3 == pars[index]
      result << 'アルバトロス'
    elsif player_score[index] + 2 == pars[index]
      result << 'イーグル'
    elsif player_score[index] + 1 == pars[index]
      result << 'バーディ'
    elsif player_score[index] == pars[index]
      result << 'パー'
    elsif player_score[index] > pars[index]
      point = player_score[index] - pars[index]
      result << if point > 2
                  "#{point}ボギー"
                else
                  'ボギー'
                end
    end
  end
  puts result.join(',')
end

# text_case.txtに履いてある2つの配列を標準入力で読み込んで配列にいれる
pars = gets.chomp.split(',').map(&:to_i)
player_score = gets.chomp.split(',').map(&:to_i)

calc_golf_score(pars, player_score)
