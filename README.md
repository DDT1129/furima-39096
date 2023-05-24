## usersテーブル

|Column              |Type            |Options                     |
| ------------------ | -------------- | -------------------------- |
|email               |string          |null: false, unique: true   |
|encrypted_password  |string          |null: false                 |
|name                |string          |null: false                 |

## itemsテーブル

|Column        |Type            |Options                          |
| ------------ | -------------- | ------------------------------- |
|name          |string          |null: false                      |
|price         |string          |null: false                      |
|comment       |text            |null: false                      |
|user          |references      |null: false , foreign_key: true  |

## addressesテーブル

|Column         |Type        |Options                         |
| ------------- | ---------- | ------------------------------ |
|address        |text        |null: false                     |
|phone          |string      |null: false                     |
|user           |references  |null: false ,foreign_key: true  |

## order_recodesテーブル

|Column         |Type        |Options                         |
| ------------- | ---------- | ------------------------------ |
|user           |references  |null: false  ,foreign_key: true |
|item           |references  |null: false  ,foreign_key: true |
|address        |references  |null: false  ,foreign_key: true |