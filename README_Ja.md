# カスタムフィールド(チェックボックス)の使用性向上プラグイン
[English](README.md)

「ユーザ」および「リスト」形式の「カスタムフィールド」の使い勝手を良くするためのプラグインです。  
「複数選択可」でかつ「チェックボックス」表示の「カスタムフィールド」で有効になります。  
カスタムフィールドユーザの担当者化プラグイン（custom_users_as_assignees）と組み合わせて、複数担当者指定の使い勝手を良くするために開発しました。
https://github.com/preciousplum/custom_users_as_assignees

## インストール方法

1. プラグインのインストール

    実行環境のRedmineパスの`plugins/customfield_checkbox_utility`に対して`git clone`を実行してください。

        $ cd {RAILS_ROOT}/plugins
        $ git clone https://github.com/preciousplum/customfield_checkbox_utility

2. Redmineの再起動

    再起動後 **管理 > プラグイン** でこのプラグインが表示されます。  
    *) データベースのマイグレーションは必要ありません。

## 互換性
原理的には、このプラグインはRedmine 3.４.＊に対して互換性があります。  
ただし、現状Redmine 3.4.5でしか動作確認されていません。

## 画面イメージ

「ユーザ」および「リスト」形式の「カスタムフィールド」で「ワイド表示」の設定ができるように拡張しています。  
「ワイド表示」を設定ですることでチェックボックスの表示領域を有効活用できます。
![画面イメージ](assets/images/FullWidthLayout.png)  

「ワイド表示」設定を行っていない通常の表示  
![画面イメージ](assets/images/Normal.png)  

「ワイド表示」設定を行った時の表示  
![画面イメージ](assets/images/Wide.png)  

「すべてチェック」をクリックすることで、全チェックボックスを一斉にチェックできます。  
![画面イメージ](assets/images/CheckAll.png)  

「すべて外す」をクリックすることで、全チェックボックスを一斉にチェックを外すことができます。  
![画面イメージ](assets/images/UncheckAll.png)  

「グループ」を選択し、メンバーを一斉にチェックしたり、外したりすることができます。(「ユーザ」形式の「カスタムフィールド」の場合)  
![画面イメージ](assets/images/CheckGroup.png)  

「フィルタ」でチェックボックスの表示をフィルタすることができます。  
![画面イメージ](assets/images/Filter.png)  

チェック済みでチェックボックスだけ表示することもできます。  
![画面イメージ](assets/images/ShowChecked.png)  
