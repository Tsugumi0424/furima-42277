# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| name               | string  | null: false |
| name_pronounce     | string  | null: false |
| birth_date         | integer | null: false, foreign_key: true |

### Association
- has_many :item
- has_many :order


## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| description        | text       | null: false |
| category           | integer    | null: false, foreign_key: true |
| condition          | integer    | null: false, foreign_key: true |
| shipping_cost      | integer    | null: false, foreign_key: true |
| shipping_origin    | integer    | null: false, foreign_key: true |
| delivery_time      | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order


## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_many   :address


## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| order              | references | null: false, foreign_key: true |
| post_code          | string     | null: false |
| prefecture         | integer    | null: false, foreign_key: true |
| municipalities     | string     | null: false |
| street_number      | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |

### Association
- belongs_to :order