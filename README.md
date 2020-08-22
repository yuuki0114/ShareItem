# アプリケーションのリンク先
https://shareitemapp.herokuapp.com/

# 概要
自分の持っているものを他の方にレンタルできるアプリケーションです。
今使ってはいないけれど、捨てたり、売りたくはないものをレンタルして有効活用できればと思い作成しました。例えば、会社員の方が車を所有していて、休日しか利用しないので、平日も有効活用したい、といった方にも利用していただければと思います。

# テストアカウント
こちらをご利用ください

・メールアドレス
  hoge@gmail.com

・パスワード
  password

# 主な機能
ユーザー<br>
 ・ユーザー登録、ログイン、ログアウト<br>
 ・既に登録のあるメールアドレスで登録できない

出品機能<br>
 ・必須事項を入力することにより、商品を出品することができます。<br>
 (必須箇所は、商品名、詳細、レンタル期間、価格、画像、貸し出し場所です。)

詳細機能<br>
 ・トップページで表示されている商品をクリックすると商品の詳細を確認することができます。

支払い機能<br>
 ・ユーザーがログインをした後、支払い登録を行うことで、商品の詳細ページから商品をレンタルすることができます。<br>
 ・支払い登録に必要な情報は下記の通りです。<br>
  カード番号<br>
  4242424242424242<br>
  有効期限<br>
  12月 2021年<br>
  セキュリティコード<br>
  123

今後実装したいこと<br>
 ・ユーザー毎に出品した商品を見ることができるページの作成<br>
 ・お気に入り機能<br>
 ・herokuの仕様で時間が経つと画像が消えてしまい、その結果画像のない商品は購入できなくなるため、AWS S3などを利用して画像が消えないようにしたい