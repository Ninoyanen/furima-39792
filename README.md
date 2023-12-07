# README

## USERS TABLE
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :orders



## ITEMS TABLE
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| post_day_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

has_one_attached :image
<!-- imageはActiveStorageでの実装のため、テーブルに含まない-->

### Association
- belongs_to :user
- has_one :order



## ORDERS TABLE
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address



## ADDRESSES TABLE
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street_code    | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     |                                |
| phone_num      | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

<!-- クレジットカードの番号、有効期限、セキュリティーコードは保存しない -->

### Association
belongs_to :order



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
