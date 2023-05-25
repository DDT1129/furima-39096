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
|birthday            |date            |null: false                 |

### Association

- has_many :items
- has_many :order_recodes


## itemsテーブル

|Column             |Type            |Options                          |
| ----------------- | -------------- | ------------------------------- |
|name               |string          |null: false                      |
|explanation        |text            |null: false                      |
|price              |integer         |null: false                      |
|category_id        |integer         |null: false                      |
|detail_id          |integer         |null: false                      |
|shipping_price_id  |integer         |null: false                      |
|prefecture_id      |integer         |null: false                      |
|shipping_date_id   |integer         |null: false                      |
|user               |references      |null: false , foreign_key: true  |

### Association

  belongs_to :user
- has_one :order_recode

## addressesテーブル

|Column          |Type        |Options                         |
| -------------- | ---------- | ------------------------------ |
|post_code       |string      |null: false                     |
|prefecture_id   |integer     |null: false                     |
|municipalities  |string      |null: false                     |
|house_number    |string      |null: false                     |
|building        |string      |                                |
|phone           |string      |null: false                     |
|order_recode    |references  |null: false ,foreign_key: true  |

### Association


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