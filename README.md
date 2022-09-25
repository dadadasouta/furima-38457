# README

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

# テーブル

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_one :customer
- has_many :items

## Customer テーブル

| Column        | Type      | Options                       |
| ------------- | --------- | ----------------------------- |
| post_code     | string    | null: false                   |
| prefecture    | string    | null: false                   |
| city          | string    | null: false                   |
| address       | string    | null: false                   |
| building_name | string    | null: false                   |
| phone_number  | string    | null: false                   |
| user_id       | reference | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :deal

## items テーブル

| Column                   | Type      | Options                        |
| ------------------------ | --------- | ------------------------------ |
| name                     | string    | null: false                    |
| price                    | string    | null: false                    |
| description              | text      | null: false                    |
| status                   | string    | null: false                    |
| delivery_charge          | string    |                                |
| delivery_charge_defrayer | string    | null:false                     |
| days                     | string    | null: false                    |
| category_id              | reference | null: false, foreign_key: true |
| brand_id                 | reference | null: false, foreign_key: true |
| prefecture               | string    | null: false                    |

### Association

- belongs__to :user
- has_one :orders

## orders テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| item_id     | reference | null: false, foreign_key: true |
| customer_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :customer
- belongs_to :item
