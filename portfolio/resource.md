## フロントエンドのリソース
フロントエンドはすべてGETです

### ログインなし

| URI | ページ |
|---|---|
|/|トップページ|
|/login|ログインページ|
|/signup|登録ページ|
|/shops|ショップ一覧|
|/shops/:id|ショップの詳細|
|/shops/:id/profile|ショップのプロフィール|
|/products|商品一覧|
|/products/:id|商品詳細|
|/cart|カート|

タグは/productsにクエリパラメータで渡す

### ログインあり
shopはcustomerの権限を持ち、
adminはshopとcustomerの権限を持ちます

#### customer

|URI|ページ|
|---|---|
|/checkout|決済ページ|
|/checkout/success|決済完了|
|/checkout/cancel|決済取り消し|
|/dashboard|一般ダッシュボード|
|/dashboard/orders|注文履歴|
|/dashboard/orders/:id|注文履歴詳細|
|/dashboard/setup_shop|ショップ開店|

#### shop
|URI|ページ|
|---|---|
|/dashboard/shop/profile|ショッププロフィール編集|
|/dashboard/shop/products|ショップ用商品一覧|
|/dashboard/shop/products/new|商品追加|
|/dashboard/shop/products/:id/edit|商品編集|
|/dashboard/shop/orders|販売履歴|
|/dashboard/shop/orders/:id|販売履歴詳細|

#### admin
|URI|ページ|
|---|---|
|/dashboard/admin/users|ユーザー一覧|

## バックエンドのリソース
バックエンドのリソースは、
「動的なGET」とPOST、PATCH、DELETEです

### ログインなし
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/shops|ショップ一覧を取得|
|GET|/shops/:id|ショップ詳細を取得|
|GET|/shops/:id/profile|ショッププロフィールを取得|
|GET|/products|商品一覧を取得、絞り込み対応|
|GET|/products/:id|商品詳細を取得|
|GET|/cart|カートの情報を取得|

### カート（ログインしなくても入れられる)
|HTTPメソッド|URI|役割|
|---|---|---|
|POST|/cart/items|カートにアイテムを入れる|
|PATCH|/cart/items/:id|カートのアイテムを変更する|
|DELETE|/cart/items/:id|カートのアイテムを削除する|

### 決済
|HTTPメソッド|URI|役割|
|---|---|---|
|POST|/checkout|要ログイン、PaymentIntent作成、client_secretを返す|
|POST|/webhooks/stripe|StripeにPOSTさせる、署名検証必須、ログイン不要|

### 注文履歴(customerログイン)
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/dashboard/orders|customerの注文一覧|
|GET|/dashboard/orders/:id|customerの注文詳細|

### 住所(customerログイン)
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/user_address|自分の住所を取得|
|POST|/user_address|自分の住所を登録する|
|PATCH|/user_address|自分の住所を編集する|

### ショップ情報(shopログイン)
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/dashboard/shop/profile|自分のショッププロフィールを見る|
|PATCH|/dashboard/shop/profile|自分のショッププロフィールを更新する|

### 商品情報(shopログイン)
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/dashboard/shop/products|自分のショップの商品一覧を取得|
|POST|/dashboard/shop/products|自分のショップに商品を新規追加|
|GET|/dashboard/shop/products/:id|自分のショップの商品詳細を取得|
|PATCH|/dashboard/shop/products/:id|自分のショップの商品を更新|
|PATCH|/dashboard/shop/products/:id/publish|商品の公開非公開切り替え|
|DELETE|/dashboard/shop/products/:id|自分のショップの商品の削除|

### 販売履歴(shopログイン)
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/dashboard/shop/orders|自分の販売履歴一覧|
|GET|/dashboard/shop/orders/:id|自分の販売履歴詳細|

### admin用
|HTTPメソッド|URI|役割|
|---|---|---|
|GET|/dashboard/admin/users|ユーザー一覧を取得

## 注意書き
Auth.jsとStripeはまだ使ったことないので  
それらに合わせて、リソースが変わることがあります

パスワードを使わずAuth.jsのマジックリンクと、  
Google認証を使い、  
JWTでRailsと通信します

通知、お気に入り、レビュー、レーティングなど  
最低限以外の機能は、保留します