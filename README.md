# アプリケーション名
LifeStory

# アプリケーション概要
LifeStoryは、ユーザーが写真をアップロードし、アルバムを作成・共有することができる写真共有アプリケーションです。ユーザーは自分のアルバムを整理し、他のユーザーと共有することができます。

# URL

# テスト用アカウント
メール：0@0　パスワード：123456

# 利用方法
ユーザーログインまたは新規登録を行います。
ログイン後、「作成する」ボタンをクリックして新しいアルバムを作成します。
アルバム内に写真を追加し、アルバムを整理します。
アルバムを他のユーザーと共有したい場合、「共有」オプションを使用します。
マイページにアクセスして、自分のアルバムや写真を管理します。

# アプリケーションを作成した背景
LifeStoryは、友人や家族と大切な思い出を簡単に共有するためのプラットフォームとして誕生しました。ユーザーが思い出を手軽に保存し、共有できるようにすることで、より多くの笑顔を生み出すことを目指しています。

# 洗い出した要件
ユーザー登録、ログイン機能
ログイン後のマイページ表示
アルバム作成機能
写真アップロード機能
アルバムの編集・削除機能
写真の編集・削除機能

# 実装予定の機能
スライドショー機能
アルバムのダウンロード機能
写真のタグ付け機能
ソーシャルメディアとの連携機能

# データベース設計

# 画面遷移図

# 開発環境
フロントエンド: HTML, CSS
バックエンド: Ruby on Rails 7

# 工夫したポイント
ユーザーが直感的に操作できるシンプルなインターフェースを目指しました。
レスポンシブデザインを取り入れ、スマートフォンやタブレットからも快適に利用できるようにしました。
アルバムや写真を簡単に共有できる共有機能を実装しました。
データベースの設計を工夫し、効率的にデータを管理できるようにしました。

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

