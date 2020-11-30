
# テーブル設計

## users

| Column                  | Type   | Option      |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| first_name              | string | null: false |
| last_name               | string | null: false |
| birth_day               | string | null: false |

###　アソシエーション

- has_many :items
- has_many :orders


## items

| Column         | Type   | Option      |
| -------------- | ------ | ----------- |
| image          | string | null: false |
| name           | string | null: false |
| explanation    | text   | null: false |
| category       | string | null: false |
| condition      | string | null: false |
| delivery_fee   | string | null: false |
| delivery_area  | string | null: false |
| delivery_date  | string | null: false |
| price          | string | null: false |

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
has_one :item
has_one :address


## addresses

| Column                 | Type   | Option      |
| ---------------------- | ------ | ----------- |
| postal_code            | string | null: false |
| prefecture             | string | null: false |
| city                   | string | null: false |
| number                 | string | null: false |
| building               | string | null: false |
| phone_number           | string | null: false |

### アソシエーション

belongs_to :order
