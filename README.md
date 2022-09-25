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

- has_many :items
- has_many :orders

## Customer テーブル

| Column        | Type      | Options                       |
| ------------- | --------- | ----------------------------- |
| post_code     | string    | null: false                   |
| prefecture    | string    | null: false                   |
| city          | string    | null: false                   |
| address       | string    | null: false                   |
| building_name | string    | null: false                   |
| phone_number  | string    | null: false                   |
| user          | reference | null: false, foreign_key:true |

### Association

- has_one :order

## items テーブル

| Column                   | Type      | Options                        |
| ------------------------ | --------- | ------------------------------ |
| name                     | string    | null: false                    |
| price                    | integer   | null: false                    |
| description              | text      | null: false                    |
| status                   | integer   | null: false                    |
| delivery_charge_defrayer | integer   | null: false                    |
| days                     | integer   | null: false                    |
| prefecture_id            | integer   | null: false                    |
| user                     | reference | null: false, foreign_key: true |

### Association

- belongs__to :user
- has_one :order

## orders テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| item     | reference | null: false, foreign_key: true |
| customer | reference | null: false, foreign_key: true |
| user     | reference | null: false, foreign_key: true |

### Association

- belongs_to :customer
- belongs_to :item
- belongs_to :user
