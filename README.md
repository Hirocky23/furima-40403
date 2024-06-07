1. users テーブル

- has_many :products
- has_many :purchases

|Column------------|Type--|Options---------|
|------------------|------|----------------|
|nickname----------|string|NOT NULL--------|
|email-------------|string|NOT NULL, UNIQUE|
|encrypted_password|string|NOT NULL--------|
|first_name--------|string|NOT NULL--------|
|last_name---------|string|NOT NULL--------|
|first_name_kana---|string|NOT NULL--------|
|last_name_kana----|string|NOT NULL--------|
|birth_date--------|DATE--|NOT NULL--------|

2. products テーブル

- belongs_to :user
- has_one :purchase

|Column---------|Type------|Options-------------------------------------------------------------------------------|
|---------------|----------|--------------------------------------------------------------------------------------|
|user_id--------|references|NOT NULL, FOREIGN KEY REFERENCES users(id)--------------------------------------------|
|name-----------|string----|NOT NULL------------------------------------------------------------------------------|
|description----|TEXT------|NOT NULL------------------------------------------------------------------------------|
|category-------|string----|NOT NULL, CHECK (category IN ('---', 'メンズ', 'レディース', 'ベビー・キッズ', 'インテリア・住まい・小物', '本・音楽・ゲーム', 'おもちゃ・ホビー・グッズ', '家電・---------------------------|スマホ・カメラ', 'スポーツ・レジャー', 'ハンドメイド', 'その他'))-------------------------|
|condition------|string----|NOT NULL, CHECK (condition IN ('---', '新品・未使用', '未使用に近い', '目立った傷や汚れなし', 'やや傷や汚れあり', '傷や汚れあり', '全体的に状態が悪い'))|
|shipping_payer-|string----|NOT NULL, CHECK (shipping_payer IN ('---', '着払い(購入者負担)', '送料込み(出品者負担)'))|
|shipping_region|string----|NOT NULL, CHECK (shipping_region IN ('---', '北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉---------------------------|県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵---------------------------|庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '岡山県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', ---------------------------|'大分県', '宮崎県', '鹿児島県', '沖縄県'))----------------------------------------------|
|shipping_days--|string----|NOT NULL, CHECK (shipping_days IN ('---', '1~2日で発送', '2~3日で発送', '4~7日で発送'))-|
|price----------|integer---|NOT NULL, CHECK (price >= 300 AND price <= 9999999)-----------------------------------|
|image_url------|string----|NOT NULL------------------------------------------------------------------------------|

3. purchases テーブル

- belongs_to :user
- belongs_to :product
- has_one :shipping_address

|Column----|Type----^-|Options--------------------------------------|
|----------|--------^-|---------------------------------------------|
|user_id---|references|NOT NULL, FOREIGN KEY REFERENCES users(id)---|
|product_id|references|NOT NULL, FOREIGN KEY REFERENCES products(id)|

4. shipping_addresses テーブル

- belongs_to :purchase

|Column-------|Type------|Options----------------------------------------|
|-------------|----------|-----------------------------------------------|
|purchase_id--|references|NOT NULL, FOREIGN KEY REFERENCES purchases(id)-|
|postal_code--|string    |NOT NULL, CHECK (postal_code ~ '^\d{3}-\d{4}$')|
|prefecture---|string----|NOT NULL---------------------------------------|
|city---------|string    |NOT NULL---------------------------------------|
|address_line-|string----|NOT NULL---------------------------------------|
|building_name|string----|-----------------------------------------------|
|phone_number-|string----|NOT NULL, CHECK (phone_number ~ '^\d{10,11}$')-|
