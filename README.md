#DB設計
***
##users table
***

| column | type | option |
|:-----------|------------:|:------------:|
| name       | string      | null: false,index: true,unique: true         |
| mail     | text      | null: false       |
| image       | text        | null: false         |
| password    | text          | null: false,unique: true           |

##Association
+has_many :messages
+has_many :group_users
+has_many :groups, through :group_users
***

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
