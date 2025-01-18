## 残しておきたいRailsのコードを保存できるアプリ　「Railsめも」
<a href="https://gyazo.com/4b83dc974f3738287e8bc04774b58dc7"><img src="https://i.gyazo.com/4b83dc974f3738287e8bc04774b58dc7.png" alt="Image from Gyazo" width="1400"/></a>

## ■アプリURL
https://rails-memo.com/

## ■サービス概要

Railsでエラーが出た時や各ファイルで記載したコードを消さずに取っておきたい人向けのアプリです。
コードの保存やお気に入り、リマインド通知の作成などが可能なメモ形式のサービスです。
どこにコードを保存したのかを見つけやすく、いつでもコードを見返す事ができるのが特徴です。

## ■Railsに絞った理由
Rails on Ruby を学習しているためエラーの内容やコードを保存する際に必要な事項をイメージがしやすいかったことです。rubyではなくrailsなのはファイル数やファイル名など複数あり、コードを保存する際に予めファイル名などが付いていれば自分で命名する手間が減るなどコード保存アプリとしてメリットがあるためです。

## ■ 問題

デフォルトのメモ帳アプリや同様のメモアプリにもコードを保存することは出来ますが、
メモの量が多くなったり、コード以外のことも記載したりすると、どこに
どのコードを記載したか分からなくる‥ということもあります。

## ■ 解決法
controller‥など記載しなくても選択でcontrollerやmodelなど記載したいファイル名を選べたり、
いつどんなコードを記載したか検索、お気に入りや通知を作成してリマインドするなど
簡単にどんなコードを書いたか見返せます。

## ■ おすすめしたいユーザー
記載したコードを消さずに取っておきたい人、メモに保存してもメモの量が多くなりコードをどこに記載したか分からなくなってしまう人向け

## ■ 機能一覧
- ユーザー登録、ログイン機能(devise)
- SNSログイン機能(omniauth-twitter2 & omniauth-google-oauth2 & omniauth-rails_csrf_protection)
- 投稿機能
  - 記事の作成
- TwitterおよびGoogleログイン(TwitterAPI+GoogleAPI & Devise)
- マルチ検索機能（ransack & rails-autocomplete & JQuery）
- 通知作成(Rakeタスク & cron)
- お気に入り機能(Ajax)
- ページネーション機能(kaminari)

## ■ 使用技術
- Ruby 3.2.2
- Ruby on Rails 7.0.5
- Puma
- Bootstrap 4(CSSフレームワーク)
- Font Awesome
- Rspec
- FaaS
  - fly.io

## ■ テスト(Rspec)
- 統合テスト(system spec model)
