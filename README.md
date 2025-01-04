# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |

### Association

- has_many :albums
- has_many :photos (アルバムに含まれる)
- has_many :comments

## albums テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| user             | references | null: false foreign_key: true  |

### Association

- has_many :photos
- belongs_to :user

## photos テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| description	  | text       |                                |
| album         | references | null: false foreign_key: true  |
| user          | references | null: false foreign_key: true  |

### Association

- belongs_to :album
- belongs_to :user
- has_many :comments

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| content        | text       | null: false                    |
| user           | references | null: false foreign_key: true  |
| photo          | references | null: false foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :photo