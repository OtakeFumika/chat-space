#DB設計
***
## users table
***

| column | type | option |
|:-----------|------------:|:------------:|
| name       | string      | null: false,index: true,unique: true         |
| mail     | text      | null: false       |
| image       | text        | null: false         |
| password    | text          | null: false,unique: true           |

## Association
- has_many :group_users
- has_many :groups, through :group_users
***

## messages table
***

| column | type | option |
|:-----------|------------:|:------------:|
| text       | text        |              |
| image      | text        |              |
| user_id    | integer     | foreign_key :true |
| group_id   | integer     | foreign_key :true |

## Association
- belongs_to :user
- belongs_to :group
***

## groups table
***

| column | type | option |
|:-----------|------------:|:------------:|
| name       | string        | null:false         |


## Association
- has_many :messages
- has_many :group_users
- has_many :users, through :group_users
***

## group_users table
***


| column | type | option |
|:-----------|------------:|:------------:|
| user_id    | integer     | foreign_key :true             |
| group_id   | integer     | foreign_key :true             |

## Association
- belongs_to :user
- belongs_to :group





