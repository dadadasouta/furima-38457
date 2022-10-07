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

## Addresses テーブル

| Column        | Type      | Options                       |
| ------------- | --------- | ----------------------------- |
| postal_code   | string    | null: false                   |
| prefecture_id | integer   | null: false                   |
| city          | string    | null: false                   |
| addresses     | string    | null: false                   |
| building      | string    |                               |
| phone_number  | string    | null: false                   |
| user          | reference | null: false, foreign_key:true |

### Association

- belongs_to :order

## items テーブル

| Column                      | Type      | Options                        |
| --------------------------- | --------- | ------------------------------ |
| name                        | string    | null: false                    |
| price                       | integer   | null: false                    |
| description                 | text      | null: false                    |
| status_id                   | integer   | null: false                    |
| delivery_charge_defrayer_id | integer   | null: false                    |
| day_id                      | integer   | null: false                    |
| prefecture_id               | integer   | null: false                    |
| category_id                 | integer   | null: false                    |
| user                        | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| item   | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign_key: true |

### Association

- has_one :addresses
- belongs_to :item
- belongs_to :user
