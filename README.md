
# テーブル設計

## users

| Column                           | Type   | Option      |
| -------------------------------- | ------ | ----------- |
| nickname                         | string | null: false |
| email                            | string | null: false |
| encrypted_password               | string | null: false |
| first_name                       | string | null: false |
| last_name                        | string | null: false |
| first_name_katakana              | string | null: false |
| last_name_katakana               | string | null: false |
| birth_day                        | date   | null: false |

###　アソシエーション

- has_many :items
- has_many :orders


## items

| Column           | Type       | Option                         |
| ---------------- | -----------| ------------------------------ |
| name             | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key :true |

### アソシエーション

belongs_to :user
has_one :order


## orders

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

###　アソシエーション

belongs_to :user
belongs_to :item
has_one :address


## addresses

| Column                 | Type        | Option            |
| ---------------------- | ----------- | ----------------- |
| postal_code            | string      | null: false       |
| prefecture_id          | integer     | null: false       |
| city                   | string      | null: false       |
| number                 | string      | null: false       |
| building               | string      |                   |
| phone_number           | string      | null: false       |
| order                  | references  | foreign_key: true |

### アソシエーション

belongs_to :order

