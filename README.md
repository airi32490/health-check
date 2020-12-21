# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| checker_id         | integer | null: false               |

### Association

- has_many :conditions

## healths テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| body_temperature | float      | null: false                    |
| condition_id     | integer    | null: false                    |
| alcohol_level    | float      | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user