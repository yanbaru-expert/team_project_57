# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

require "csv"

CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create(
    genre: row["genre"],
    title: row["title"],
    url: row["url"]
  )
end

CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create(
    genre: row["genre"],
    title: row["title"],
    content: row["content"]
  )
end

email = "test@example.com"
admin_email = "admin@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

AdminUser.find_or_create_by!(email: admin_email) do |admin_user|
  admin_user.password = password
  puts "管理者ユーザーの初期データインポートに成功しました。"
end