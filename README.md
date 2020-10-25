# このアプリケーションについて
※より詳細をご覧になりたい方は、以下のページをご参照願います。<br>
https://machi11038004.hatenablog.com/entry/2020/10/17/143859?_ga=2.81818453.2130748800.1602913142-1308790838.1598255207<br>
<br>
### アプリケーションURL
http://18.224.253.99/

### 概要
このアプリケーションは、「製品設計者向け課題潰し込みスケジュールツール」です。<br>
業務効率を向上し、流動的な状況下でも働きやすい環境を実現することを目的に作られました。<br>
ブラウザ上で動作するWebアプリケーションです。<br>
名前を「imanani(イマナニ)」といいます。<br>

具体的には週間業務計画をデジタル化したもので、開発中の製品に対し課題及びやる事を管理できます。<br>
表示される要素は時系列に沿って最適化され動的に配置されます。<br>

またチーム内の自分以外の方のスケジュール共有と編集が可能です。<br>
日程の見える化により、上長や同僚との業務進行に関わるコミュニケーションを支援します。<br>

### 対象のユーザー
ものづくり業界で活躍する設計者。<br>
担当部品を１〜複数個持ち、中長期（半年〜2年程度）の製品開発プロジェクトに携わる方。<br>

### 開発環境
ハードウェア...mac book air （メモリ8GB）,
ソフトウェア...Visual Studio Code

### 使用技術
HTML, CSS, Ruby on rails, Javascript, MySQL, Devise, Active Record, AWS S3及びEC2

### 推奨ブラウザ
Google Chrome

# 使用画面
ログイン画面
![ログイン画面](https://user-images.githubusercontent.com/70276196/95720153-d0fb4080-0cab-11eb-9c45-2af8cbf7e278.jpg)
スケジュール画面
![スケジュール画面](https://user-images.githubusercontent.com/70276196/95834724-4896a180-0d78-11eb-97c3-eb98f87d0cad.jpg)
課題編集画面
![課題編集画面](https://user-images.githubusercontent.com/70276196/95714340-0bacab00-0ca3-11eb-95c5-e5be87339417.jpg)
チームメンバー 一覧画面
![チームメンバー一覧画面](https://user-images.githubusercontent.com/70276196/95720170-d5bff480-0cab-11eb-8ada-d58c151e1d2c.jpg)

# 何ができるのか
- 担当開発部品の登録・編集・削除
- 担当開発部品に属する課題の登録・編集・削除
- 担当開発部品に属する課題に対するやる事の登録・編集・削除
- チームメンバーのスケジュール共有

# こんな問題を解決します
- 課題登録機能により、開発中製品の課題の抜け・漏れを防ぐ
- スケジュール共有機能により、チーム各人の進捗状況確認の手間を排除する
- やる事の動的なシフト機能により、突発業務発生時、全ての予定していた業務が何分後ろ倒しになるか即座に確認可能になる
- 課題とやる事の見える化により、上長や有識者へ業務の進め方の相談をする際に、工数と優先順位の認識の相違を最小限にする


# 実装と処理についての簡単な解説
詳細は、別ページをご参照願います。<br>
https://machi11038004.hatenablog.com/entry/2020/10/17/143859?_ga=2.81818453.2130748800.1602913142-1308790838.1598255207<br>
<br>
このアプリケーションは、Ruby on railsによるWebアプリケーションフレームワークを利用し作られています。<br>
また、AWS（Amazon Web Services）を利用しアプリケーションをデプロイしています。

このアプリケーションの特徴は、登録した製品、課題、やる事を動的に時系列順に配置する事です。

要素の配置については、Javascriptを用いて実現しています。<br>
登録した各情報はHTML要素として生成される際、自身の情報をid及びdata属性に確保します。<br>
ページを読み込んだ時に、Javascriptによりid及びdata属性に基づいて幅や位置を設定しています。<br>

またこのアプリケーションは、やる事が新たに割り込む形で挿入された際、既存のやる事を自動的に未来へシフトします。<br>
この時、やる事の開始順序は崩さず、隙間の時間は埋められ、かつ勤務時間外には作業開始時間が重複しません。<br>
これは、やる事がシフトした先に既に別のやる事が存在した場合、<br>
それも未来へシフトさせることを再起的に行うことで実現しています。
