# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :product
- has_one :order

## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping_fee_id     | integer    | null: false                    |
| shipping_origin_id  | integer    | null: false                    |
| shipping_price_id   | integer    | null: false                    |
| selling_price       | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column      | Type       | Options     |
| ---------   | ---------- | ----------- |
| user_id     | references | null: false |
| product_id  | references | null: false |
| buyer_id    | references | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer
