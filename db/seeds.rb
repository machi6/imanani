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
User.create(nickname: "鈴木 吾郎", email: "suzukigoro@suzukigoro", password: "suzukigoro0")           #id...5
User.create(nickname: "高橋 六郎", email: "takahashirokuro@takahashirokuro", password: "takahashirokuro0")  #id...6
User.create(nickname: "斎藤 七郎", email: "saitonanaro@saitonanaro", password: "saitonanaro0")     #id...7
User.create(nickname: "田中 八郎", email: "tanakahachiro@tanakahachiro", password: "tanakahachiro0")           #id...8
User.create(nickname: "藤原 九郎", email: "fujiwarakuro@fujiwarakuro", password: "fujiwarakuro0")  #id...9
User.create(nickname: "小林 十郎", email: "kobayashijuro@kobayashijuro", password: "kobayashijuro0")     #id...10

#新人太郎君の担当部品
Product.create(user_id: 1, name: "FRONT BEAM")                                                         #id...1
Product.create(user_id: 1, name: "FRONT FRAME")                                                         #id...2
Product.create(user_id: 1, name: "RADIATOR PANEL")                                                     #id...3

#同期次郎君の担当部品
Product.create(user_id: 2, name: "FRONT PLR")                                                          #id...4
Product.create(user_id: 2, name: "CENTER PLR")                                                         #id...5
Product.create(user_id: 2, name: "REAR PLR")                                                           #id...6

#FRONT BEAMの課題
Issue.create(product_id: 1, summary: "成型性NG", description: "")                   #id...1
Issue.create(product_id: 1, summary: "溶着ガンスキ不足", description: "")                   #id...2
Issue.create(product_id: 1, summary: "めくら作業あり", description: "")                  #id...3
Issue.create(product_id: 1, summary: "牽引性能未達", description: "")                   #id...4
Issue.create(product_id: 1, summary: "基準穴が存在しない", description: "")                   #id...5

#FRONT FRAMEの課題
Issue.create(product_id: 2, summary: "溶着ガンスキ不足", description: "")
Issue.create(product_id: 2, summary: "シール性能未達", description: "")
Issue.create(product_id: 2, summary: "部品共用可否", description: "")

#RADIATOR PANELの課題
Issue.create(product_id: 3, summary: "水溜り箇所あり", description: "")
Issue.create(product_id: 3, summary: "フードとの整合性確認", description: "")

#FRONT PLR
Issue.create(product_id: 4, summary: "ナット溶着不足懸念", description: "")

#CENTER PLR
Issue.create(product_id: 5, summary: "剛性感不足", description: "")

#REAR PLR
Issue.create(product_id: 6, summary: "打点数削減可否", description: "")

#新人太郎君の予定
Task.create(issue_id: 1, title: 'データ作成',     start: '2020-10-19 07:00:00', time: '01:00:00')
Task.create(issue_id: 1, title: '生産技術と調整',  start: '2020-10-19 08:00:00', time: '02:00:00')
Task.create(issue_id: 1, title: '得意先と調整',    start: '2020-10-19 010:00:00', time: '01:00:00')
Task.create(issue_id: 1, title: '作業性検討',     start: '2020-10-19 11:00:00', time: '04:00:00')
Task.create(issue_id: 2, title: 'データ作成',     start: '2020-10-19 15:00:00', time: '01:30:00')
Task.create(issue_id: 2, title: '生産技術と調整',  start: '2020-10-19 16:30:00', time: '02:30:00')
Task.create(issue_id: 2, title: '見積依頼書作成',  start: '2020-10-20 7:00:00', time: '02:00:00')
Task.create(issue_id: 2, title: '技術検討依頼書作成', start: '2020-10-20 09:00:00', time: '03:30:00')
Task.create(issue_id: 3, title: 'データ作成', start: '2020-10-20 12:30:00', time: '00:30:00')
Task.create(issue_id: 3, title: '技術検討依頼書作成', start: '2020-10-20 13:00:00', time: '04:00:00')
Task.create(issue_id: 3, title: 'データ作成', start: '2020-10-20 17:00:00', time: '01:00:00')
Task.create(issue_id: 3, title: '見積依頼書作成', start: '2020-10-21 07:00:00', time: '03:00:00')
Task.create(issue_id: 4, title: 'データ作成', start: '2020-10-21 10:00:00', time: '02:30:00')
Task.create(issue_id: 4, title: '技術検討依頼書作成', start: '2020-10-21 12:30:00', time: '04:00:00')
Task.create(issue_id: 4, title: 'データ作成', start: '2020-10-21 16:30:00', time: '00:30:00')
Task.create(issue_id: 4, title: '可否検討', start: '2020-10-21 17:00:00', time: '03:00:00')