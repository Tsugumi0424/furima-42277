# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_pronounce     | string | null: false |


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| description        | text       | null: false |
| image              | text       | null: false |

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| order              | references | null: false, foreign_key: true |
| post_code          | string     | null: false |
| municipalities     | string     | null: false |
| street_number      | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |