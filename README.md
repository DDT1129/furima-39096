## usersテーブル

|Column              |Type            |Options                     |
| ------------------ | -------------- | -------------------------- |
|nickname            |string          |null: false                 |
|email               |string          |null: false, unique: true   |
|encrypted_password  |string          |null: false                 |
|first_name          |string          |null: false                 |
|last_name           |string          |null: false                 |
|first_name_kana     |string          |null: false                 |
|last_name_kana      |string          |null: false                 |
|birthday            |string          |null: false                 |

### Association

- has_many :items
- has_many :order_recodes
- has_one :address

## itemsテーブル

|Column          |Type            |Options                          |
| -------------- | -------------- | ------------------------------- |
|name            |string          |null: false                      |
|explanation     |text            |null: false                      |
|price           |string          |null: false                      |
|category        |string          |null: false                      |
|detail          |string          |null: false                      |
|shipping_price  |string          |null: false                      |
|ship_from       |string          |null: false                      |
|shipping_date   |string          |null: false                      |
|user            |references      |null: false , foreign_key: true  |

### Association

  belongs_to :user
- has_one :order_recode

## addressesテーブル

|Column          |Type        |Options                         |
| -------------- | ---------- | ------------------------------ |
|post_code       |string      |null: false                     |
|prefectures     |string      |null: false                     |
|municipalities  |string      |null: false                     |
|house_number    |string      |null: false                     |
|building        |string      |null: false                     |
|phone           |string      |null: false                     |
|order_recodes   |references  |null: false ,foreign_key: true  |

### Association

  belongs_to :user
- belongs_to :order_recode

## order_recodesテーブル

|Column         |Type        |Options                         |
| ------------- | ---------- | ------------------------------ |
|user           |references  |null: false  ,foreign_key: true |
|item           |references  |null: false  ,foreign_key: true |


### Association

  belongs_to :user
  belongs_to :item
- has_one :address