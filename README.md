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

- has_one :credit card
- has_one :customer
- has_many :comments
- has_many :products

## credit card テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key:true  |
| card_id | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user

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

## comments テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| content    | string    | null: false                    |
| product_id | reference | null: false, foreign_key: true |
| user_id    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## products テーブル

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
- has_many :comments
- has_one :deal
- belongs_to :category
- belongs_to :brand

## deal テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| product_id  | reference | null: false, foreign_key: true |
| customer_id | reference | null: false, foreign_key: true |

### Association

- belongs_to :customer
- belongs_to :product

## category テーブル

| Column | Type   | Options |
| ------ | ------ | ------- |
| name   | string |         |

### Association

- has_many :products

## brand テーブル

| Column | Type   | Options |
| ------ | ------ | ------- |
| name   | string |         |

### Association

- has_many :products