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
|/notices|通知|
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

### バックエンドのリソース
バックエンドのリソースは、
「動的なGET」とPOST、PUT、DELETEです





## 注意書き
Auth.jsとStripeはまだ使ったことないので  
それらに合わせて、リソースが変わることがあります

パスワードを使わずAuth.jsのマジックリンクと、  
Google認証を使い、  
JWTでRailsと通信します