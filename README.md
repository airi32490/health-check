# アプリケーション名
Health Check

# アプリケーション概要
職場などでの体調チェックを目的としたアプリケーション  
体温・体調・アルコール数値を入力し、基準値をオーバーした場合は上司（資格保有者）の確認が必要となる。

# URL
- https://health-check-32490.herokuapp.com/

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
ログイン後、体調チェックのリンクが表示される。  
体温・体調・アルコール数値を入力し、基準値以下であればトップページへ遷移する。  
基準値以上の場合は資格保有者がチェックする画面に遷移するため、勤務を続けるか相談した後、資格保有者のemailを入力してもらうことにより確認したものとする。その後トップページへ遷移する。  
資格保有者は、ユーザーが入力した体調チェックを検索することが可能。
# 目指した課題解決
前職では、毎日始業前に体調チェックとアルコールチェックを行い、紙に記入していた。そのため、紙の補充を定期的に行う必要と、記入漏れ・チェック漏れが散見されていた。また定期的に行われる点検では、毎日記入・チェックがされているか確認するため、一定期間分の保管も必要であった。  
これらを解決したく、今回のアプリの開発に至った。

# 洗い出した要件

| 機能 | 目的 | 詳細 | ストーリー |
| --- | ---- | --- | -------- |
| ユーザー管理機能 | 登録されたユーザーのみ使えるようにするため | 名前、email、パスワード、資格の有無を登録させる | 新規登録の際、資格確認保有かどうかを選択させる |
| 体調チェック入力機能 | コロナが疑われる場合は帰らせる必要があるため | 体調と体温を入力させる | 体調は選択肢の中から選ぶ(良好・普通・不調)<br>体調が不調、体温が37℃以上の時に引っかかる |
| アルコール数値入力機能 | アルコールが残っている状態で勤務させないようにするため | アルコールチェッカーで検出された数値を入力させる | 0.15mg/L以上はチェックに引っかかる |
| 資格保有者チェック機能 | 勤務の可否を判断するため | アルコール・体調を確認した証明として資格保有者のemailを入力してもらう。 | アルコール・体調チェックに引っかかるとこの画面へ遷移する。<br>勤務の可否を相談後、確認した証明として資格保有者のemailを入力してもらう |
|検索機能 | 過去の記録を検索するため | ユーザー・日付・チェック項目ごとの検索ができる |

# 実装した機能
  - 体調・アルコールチェック入力機能
    - 基準値未満の場合
      - ![体調チェックの画面遷移①](https://gyazo.com/d8a77b12d861bc3f804dfe2daadcf914)
    - 基準値以上の場合
      - ![体調チェックの画面遷移②](https://gyazo.com/512eecae6f272e1d7f12ce556e380aef)
  - 承認〜検索機能の流れ
    - ユーザー名で検索
       - ![検索機能](https://gyazo.com/c26be1827d50cc174a2fe0efe3f5cf16)

# 実装予定の機能


# データベース設計
### ER図
![database](https://user-images.githubusercontent.com/74547623/103184429-993f8480-48fb-11eb-9d52-1b1cb57e4096.png)


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

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| nikkei    | decimal    | null: false                    |
| ny_dow    | decimal    | null: false                    |
| us_dollar | decimal    | null: false                    |
| euro      | decimal    | null: false                    |
| au_dollar | decimal    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user  


# ローカルでの動作方法
```ターミナル
% git clone https://github.com/airi32490/health-check.git  
% cd health-check
% bundle install
% rails db:create
% rails db:migrate
$ rails s
　→　http://localhost:3000
```

# 開発環境
- フロントエンド：HTML5/CSS(Bootstrap)
- バックエンド：Ruby on Rails(6.0.0)/Ruby(2.6.5)
- テスト：RSpec
- Linter：Rubocop
- データベース：MySQL(5.6.50)
- インフラ：Heroku
- タスク管理：GitHub/Trello