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
- has_one :buyer

## products テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| image            | string  | null: false                    |
| name             | string  | null: false                    |
| explanation      | string  | null: false                    |
| category         | string  | null: false                    |
| status           | string  | null: false                    |
| shipping_fee     | string  | null: false                    |
| shipping_origin  | string  | null: false                    |
| shipping_price   | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## buyers テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :user
- has_one :card

## cards テーブル

| Column      | Type       | Options     |
| -------     | ---------- | ----------- |
| card_number | string     |             |
| user        | references | null: false |
| room        | references | null: false |

### Association

- belongs_to :buyer
