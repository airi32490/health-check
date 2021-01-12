# アプリケーション名
Morning Routine

# アプリケーション概要
毎朝始業前に行うルーティーンの管理を目的としたアプリケーション
- 体調チェック機能
  - 体温・体調・アルコール数値を入力し、基準値をオーバーした場合は上司（資格保有者）の確認が必要となる。
  - 資格保有者は過去の体調チェックデータを検索することが可能。
- マーケット情報管理・確認機能
  - 日経平均株価・NYダウ・アメリカ合衆国ドル・ユーロ・オーストラリアドルを毎朝入力することで、過去のデータを保管することが可能。
  - 過去のデータを日付で検索することが可能。
  - 直近半年間のデータをグラフ化し、値動きを視覚的に確認することができる。
  - それぞれのデータに対してコメントを残すことができる。

# URL
- https://morning-routine-32490.herokuapp.com/

# テスト用アカウント
- 資格保有ユーザー①  
email : abc@gmail.com  
password : a12345  
- 資格保有ユーザー②  
email : 123@gmail.com  
password : c12345  
- 一般ユーザー  
email : aaa@gmail.com  
password : b12345

# 利用方法
- 体調チェック機能  
ログイン後、体調チェックのリンクが表示される。  
体温・体調・アルコール数値を入力し、基準値以下であればトップページへ遷移する。  
基準値以上の場合は資格保有者がチェックする画面に遷移するため、勤務を続けるか相談した後、資格保有者のemailを入力してもらうことにより確認したものとする。その後トップページへ遷移する。  
資格保有者は、ユーザーが入力した体調チェックを検索することが可能。
- マーケット情報管理機能
トップページからマーケット情報入力画面に遷移し、それぞれのマーケット情報を入力し、データを保存する。  
検索ページでは日付指定の検索ができ、検索結果ページから直近半年間のグラフページへ遷移することができる。  
視覚的に値動きを確認した後、グラフ下部にあるコメント入力フォームを使用して全体に向けてコメントを残すことができる。


# 目指した課題解決
前職では、毎日始業前に体調チェックとアルコールチェックを行い、紙に記入していた。そのため、紙の補充を定期的に行う必要と、記入漏れ・チェック漏れが散見されていた。また定期的に行われる点検では、毎日記入・チェックがされているか確認するため、一定期間分の保管も必要であった。  
また、毎朝マーケット情報を調べ、紙に記入し値動きを確認していたが、一目で値動きがわかるものがあればいいなと考えていた。
これらを解決したく、今回のアプリ開発に至った。

# 洗い出した要件

| 機能 | 目的 | 詳細 | ストーリー |
| --- | ---- | --- | -------- |
| ユーザー管理機能 | 登録されたユーザーのみ使えるようにするため | 名前、email、パスワード、資格の有無を登録させる | 新規登録の際、資格確認保有かどうかを選択させる |
| 体調チェック入力機能 | 体温と体調を確認することで、勤務の可否を判断 | 体調と体温を入力させる | 体調は選択肢の中から選ぶ(良好・普通・不調)<br>体調が不調、体温が37℃以上の時に引っかかる |
| アルコール数値入力機能 | アルコールが残っている状態で勤務させないようにするため | アルコールチェッカーで検出された数値を入力させる | 0.15mg/L以上はチェックに引っかかる |
| 資格保有者チェック機能 | 勤務の可否を判断するため | アルコール・体調を確認した証明として資格保有者のemailを入力してもらう。 | アルコール・体調チェックに引っかかるとこの画面へ遷移する。<br>勤務の可否を相談後、確認した証明として資格保有者のemailを入力してもらう |
|検索機能 | 過去の記録を検索するため | ユーザー・日付・チェック項目ごとの検索ができる | それぞれの項目毎に検索できるようにする<br>資格保有者しか検索できないように設定する |
| マーケット情報入力機能 | 毎日のマーケット情報を保存するため | 日経平均株価・NYダウ・米ドル・ユーロ・豪ドルの情報を入力する | |
| マーケット情報検索機能 | 入力したマーケット情報を検索するため | 今まで入力したマーケット情報をわかりやすく折れ線グラフで表示 | 直近半年間のデータをそれぞれグラフ化する<br>データは半年間以上入力されていることが前提 | 
| コメント機能 | マーケット情報にコメントをするため | 最新のマーケット情報に対してのコメントを残せるようにする | 全てのマーケット情報の結果に対してコメントをするべきであるため、部分テンプレートを使用してマーケット情報間で共有できるようにする。 |

# 実装した機能
  - 体調・アルコールチェック機能
    - 基準値未満の場合
      - ![体調チェック基準値未満](https://user-images.githubusercontent.com/74547623/104169265-a2c00500-5442-11eb-8db7-ad70056b82ed.gif)
    - 基準値以上の場合
      - ![体調チェックの画面推移](https://user-images.githubusercontent.com/74547623/104255717-09820480-54bd-11eb-9891-831e342fd7b0.gif)
    - 承認〜検索機能の流れ(ユーザー名で検索)
      - ![検索機能](https://user-images.githubusercontent.com/74547623/104256117-ed329780-54bd-11eb-86e3-ebbd030c9058.gif)
  - マーケット情報機能
    - 入力画面
    - 検索機能
    - グラフ表示
    - コメント機能

# 工夫したポイント

# 実装予定の機能

# データベース設計
### ER図
![database](https://user-images.githubusercontent.com/74547623/104258052-2240e900-54c2-11eb-96fb-7693854a36e0.png)


## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| checker_id         | integer | null: false               |

### Association

- has_many :conditions
- has_many :markets
- has_many :comments

## healths テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| body_temperature | float      | null: false                    |
| condition_id     | integer    | null: false                    |
| alcohol_level    | float      | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user  

## markets テーブル

| Column    | Type       | Options                             |
| --------- | ---------- | ----------------------------------- |
| nikkei    | decimal    | null: false, precision: 7, scale: 2 |
| ny_dow    | decimal    | null: false, precision: 7, scale: 2 |
| us_dollar | decimal    | null: false, precision: 6, scale: 3 |
| euro      | decimal    | null: false, precision: 6, scale: 3 |
| au_dollar | decimal    | null: false, precision: 6, scale: 3 |
| user      | references | null: false, foreign_key: true      |

### Association

- belongs_to :user  

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| memo   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# ローカルでの動作方法
```ターミナル
% git clone https://github.com/airi32490/morning-routine.git  
% cd health-check
% bundle install
% rails db:create
% rails db:migrate
$ rails s
　→　http://localhost:3000
```

# 開発環境
- フロントエンド：HTML5/CSS(Bootstrap)/JavaScript
- バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)/JavaScript
- テスト：RSpec
- Linter：Rubocop
- データベース：MySQL(5.6.50)
- インフラ：Heroku
- タスク管理：GitHub/Trello