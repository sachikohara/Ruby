require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
#1を押した場合
if memo_type == 1
   puts "拡張子を除いたファイル名を入力してください。"
   file_name = gets.chomp
   puts "メモしたい内容を入力してください。"
   puts "完了したら、ctrl+Dを押します。"
   memo = STDIN.read
   CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{memo}"]
    end
#2を押した場合
elsif memo_type == 2
   puts "既存のファイルを編集します。拡張子を除いたファイル名を入力してください。"
   file_name = gets.chomp
   puts "メモしたい内容を入力してください。"
   puts "完了したら改行して「Ctrl＋D」を入力してください。"
   memo = STDIN.read
   CSV.open("#{file_name}.csv","a") do |csv|
    csv << ["#{memo}"]
   end
#１.２以外を押した場合
else
  puts "1か2を入力して下さい。"
end
