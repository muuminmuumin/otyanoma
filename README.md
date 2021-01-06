
# otyanoma
 介護をしている方々が、介護の悩み・相談を投稿することができるサイトです<br >
 投稿された悩み・相談にはコメントすることができます<br >
 見た目がシンプルで、誰が見てもわかりやすいサイトになるよう心がけました




# otyanoma DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :contents
- has_many :comments

## contentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|content_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :content
- belongs_to :user