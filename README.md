# furima テーブル設計

## Usersテーブル

|Column                |Type    |Options                   |
|----------------------|--------|--------------------------|
|nickname              |string  |null: false               |
|email                 |string  |null: false, unique: true |
|password              |string  |null: false               |
|password_confirmation |string  |null: false               |
|family_name           |string  |null: false               |
|first_name            |string  |null: false               |
|family_name_kana      |string  |null: false               |
|first_name_kana       |string  |null: false               |
|birthday              |integer |null: false               |

### Association
has_many: items
has_many: credit_cards
has_many: comments
has_many: purchases
has_one: destination

## Itemsテーブル

|Column          |Type      |Options                        |
|--------------- |----------|-------------------------------|
|name            |string    |null: false                    |
|introduction    |text      |null: false                    |
|price           |integer   |null: false                    |
|condition       |string    |null: false                    |
|postage_payer   |string    |null: false                    |
|preparation_day |string    |null: false                    |
|prefecture      |string    |null: false                    |
|user_id         |reference |null: false, foreign_key: true |
|category_id     |string    |null: false, foreign_key: true |

### Association
has_many: comments
has_one: purchase
has_one: destination
belongs_to: user
belongs_to: category

## Destinationテーブル

|Column        |Type     |Options                        |
|--------------|---------|-------------------------------|
|post_code     |integer  |null: false                    |
|prefecture    |string   |null: false                    |
|city          |string   |null: false                    |
|house_number  |integer  |null: false                    |
|building_name |string   |                               |
|phone_number  |integer  |null: false                    |
|user_id       |reference|null: false, foreign_key: true |
|item_id       |reference|null: false, foreign_key: true |
### Association
belongs_to:user
belongs_to:item

## credit_cardsテーブル

|Column      |Type    |Options|
|------------|--------|-------------------------------|
|user_id     |integer |null: false, foreign_key: true |
|customer_id |integer |null: false                    |
|card_id     |integer |null: false                    |

### Association
belongs_to: user

## Categoriesテーブル

|Column   |Type      |Options                        |
|---------|----------|-------------------------------|
|name     |string    |null: false                    |

### Association
has_many: items

## purchaseテーブル

|Column  |Type      |Options                        |
|--------|----------|-------------------------------|
|user_id |reference |null: false, foreign_key: true |
|item_id |reference |null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item

## Commentsテーブル

|Column  |Type      |Options                        |
|--------|----------|-------------------------------|
|content |text      |null: false                    |
|user_id |reference |null: false, foreign_key: true |
|item_id |reference |null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item