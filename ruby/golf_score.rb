# frozen_string_literal: true

SCORE_MAPPING = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  0 => 'パー',
  1 => 'ボギー'
}

def calc_golf_score(pars, player_score)
  result = []
  pars.zip(player_score).each do |par, score|
    diff = score - par

    result << case
              # ホールインワンよりコンドルを優先する
              when score == 1 && diff != -4
                'ホールインワン'
              when diff >= 2
                "#{diff}ボギー"
              else
                SCORE_MAPPING[diff]
              end
  end

  puts result.join(',')
end

# text_case.txtに書いてある2つの配列を標準入力で読み込んで配列にいれる
pars = gets.chomp.split(',').map(&:to_i)
player_score = gets.chomp.split(',').map(&:to_i)

calc_golf_score(pars, player_score)
