# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(nickname: "新人 太朗", email: "shinjintaro@shinjintaro", password: "shinjintaro0")     #id...1
User.create(nickname: "同期 次郎", email: "doukijiro@doukijiro", password: "doukijiro0")           #id...2
User.create(nickname: "上司 三郎", email: "joushisaburo@joushisaburo", password: "joushisaburo0")  #id...3
User.create(nickname: "山田 四郎", email: "yamadashiro@yamadashiro", password: "yamadashiro0")     #id...4
User.create(nickname: "鈴木 吾郎", email: "suzukigoro@suzukigoro", password: "suzukigoro0")        #id...5
User.create(nickname: "高橋 六郎", email: "takahashirokuro@takahashirokuro", password: "takahashirokuro0")  #id...6
User.create(nickname: "斎藤 七郎", email: "saitonanaro@saitonanaro", password: "saitonanaro0")     #id...7
User.create(nickname: "田中 八郎", email: "tanakahachiro@tanakahachiro", password: "tanakahachiro0")           #id...8
User.create(nickname: "藤原 九郎", email: "fujiwarakuro@fujiwarakuro", password: "fujiwarakuro0")  #id...9
User.create(nickname: "小林 十郎", email: "kobayashijuro@kobayashijuro", password: "kobayashijuro0")     #id...10

#新人太郎君の担当部品
Product.create(user_id: 1, name: "FRONT BEAM")                                                         #id...1
Product.create(user_id: 1, name: "FRONT FRAME")                                                        #id...2
Product.create(user_id: 1, name: "RADIATOR PANEL")                                                     #id...3

#新人太郎君の全課題
Issue.create(product_id: 1, summary: "成型性NG", description: "")                   #id...1
Issue.create(product_id: 1, summary: "溶着ガンスキ不足", description: "")                   #id...2
Issue.create(product_id: 1, summary: "めくら作業あり", description: "")                  #id...3
Issue.create(product_id: 1, summary: "牽引性能未達", description: "")                   #id...4
Issue.create(product_id: 1, summary: "基準穴が存在しない", description: "")                   #id...5

#FRONT FRAMEの課題
Issue.create(product_id: 2, summary: "溶着ガンスキ不足", description: "")           #id...6
Issue.create(product_id: 2, summary: "シール性能未達", description: "")             #id...7
Issue.create(product_id: 2, summary: "部品共用可否", description: "")               #id...8

#RADIATOR PANELの課題
Issue.create(product_id: 3, summary: "水溜り箇所あり", description: "")           #id...9
Issue.create(product_id: 3, summary: "フードとの整合性確認", description: "")      #id...10

#新人太郎君のスケジュール
#seedを発動した月の一日の7:00
def get_month_start
  day_start = Time.current - (Time.current.day-1)*86400 - (Time.current.hour * 3600) - (Time.current.min * 60) - (Time.current.sec) + 7 * 3600
end

#seedsファイルを読み込ませた月の頭から90日分のやることを登録する
ite = 0
while ite < 90 do
  start = get_month_start + (ite * 86400)
  Task.create(issue_id: 1, title: 'データ作成',     start: start, time: '01:00:00')
  Task.create(issue_id: 1, title: '生産技術と調整',  start: start += ( 1 * 3600), time: '02:00:00')
  Task.create(issue_id: 1, title: '得意先と調整',    start: start += ( 2 * 3600), time: '01:00:00')
  Task.create(issue_id: 1, title: '作業性検討',     start: start += ( 1 * 3600), time: '04:00:00')
  Task.create(issue_id: 2, title: 'データ作成',     start: start += ( 4 * 3600), time: '01:30:00')
  Task.create(issue_id: 2, title: '依頼書作成',     start: start += ( 1.5 * 3600 ).round, time: '02:30:00')

  start = get_month_start + ((ite + 1) * 86400)

  Task.create(issue_id: 2, title: 'データ作成',     start: start, time: '01:00:00')
  Task.create(issue_id: 2, title: '生産技術と調整',  start: start += ( 1 * 3600), time: '02:00:00')
  Task.create(issue_id: 3, title: '得意先と調整',    start: start += ( 2 * 3600), time: '01:00:00')
  Task.create(issue_id: 3, title: '作業性検討',     start: start += ( 1 * 3600), time: '04:00:00')
  Task.create(issue_id: 3, title: 'データ作成',     start: start += ( 4 * 3600), time: '01:30:00')
  Task.create(issue_id: 3, title: '依頼書作成',     start: start += ( 1.5 * 3600).round, time: '02:30:00')

  start = get_month_start + ((ite + 2) * 86400)

  Task.create(issue_id: 3, title: 'データ作成',     start: start, time: '01:00:00')
  Task.create(issue_id: 4, title: '生産技術と調整',  start: start += ( 1 * 3600), time: '02:00:00')
  Task.create(issue_id: 4, title: '得意先と調整',    start: start += ( 2 * 3600), time: '01:00:00')
  Task.create(issue_id: 4, title: '作業性検討',     start: start += ( 1 * 3600), time: '04:00:00')
  Task.create(issue_id: 4, title: 'データ作成',     start: start += ( 4 * 3600), time: '01:30:00')
  Task.create(issue_id: 4, title: '依頼書作成',     start: start += ( 1.5 * 3600).round, time: '02:30:00')

  start = get_month_start + ((ite + 3) * 86400)

  Task.create(issue_id: 5, title: 'データ作成',     start: start, time: '01:00:00')
  Task.create(issue_id: 5, title: '生産技術と調整',  start: start += ( 1 * 3600), time: '02:00:00')
  Task.create(issue_id: 5, title: '得意先と調整',    start: start += ( 2 * 3600), time: '01:00:00')
  Task.create(issue_id: 5, title: '作業性検討',     start: start += ( 1 * 3600), time: '04:00:00')
  Task.create(issue_id: 6, title: 'データ作成',     start: start += ( 4 * 3600), time: '01:30:00')
  Task.create(issue_id: 6, title: '依頼書作成',     start: start += ( 1.5 * 3600).round, time: '02:30:00')

  start = get_month_start + ((ite + 4) * 86400)

  Task.create(issue_id: 6, title: 'データ作成',     start: start, time: '01:00:00')
  Task.create(issue_id: 7, title: '生産技術と調整',  start: start += ( 1 * 3600), time: '02:00:00')
  Task.create(issue_id: 7, title: '得意先と調整',    start: start += ( 2 * 3600), time: '01:00:00')
  Task.create(issue_id: 7, title: '作業性検討',     start: start += ( 1 * 3600), time: '04:00:00')
  Task.create(issue_id: 8, title: 'データ作成',     start: start += ( 4 * 3600), time: '01:30:00')
  Task.create(issue_id: 8, title: '依頼書作成',     start: start += ( 1.5 * 3600).round, time: '02:30:00')

  ite += 5
end

# Task.create(issue_id: 1, title: 'データ作成',     start: '2020-10-19 07:00:00', time: '01:00:00')



#同期次郎君の担当部品
Product.create(user_id: 2, name: "FRONT PLR")                                                          #id...4
Product.create(user_id: 2, name: "CENTER PLR")                                                         #id...5
Product.create(user_id: 2, name: "REAR PLR")                                                           #id...6



#FRONT PLR
Issue.create(product_id: 4, summary: "ナット溶着不足懸念", description: "")

#CENTER PLR
Issue.create(product_id: 5, summary: "剛性感不足", description: "")

#REAR PLR
Issue.create(product_id: 6, summary: "打点数削減可否", description: "")

