鍛冶屋のチェスト内のアイテム生成をシュミレーションします。ネタです。なるべく生成アルゴリズムに則っています。  

## 動作条件
- 通常版　.NET Framework 4.8のランタイムがインストールされている必要があります。
- AHKバージョン　スタンドアローン化済みなので、ランタイムなど不要で動作するばずです。  

NightBotコマンド化もしたかったですが、文字数が余裕でオーバーするので諦めました。  

#### AHKバージョン
仕様上、初回起動時に、ランサムウェア判定される場合があります。  
Gui Textの使い勝手こんな悪かったっけ？ってくらい使い勝手悪いので、無理やり描画してます。多分もっといい方法ある。  
動作の安定性を求めるなら通常版ですが、安定性求めるようなツールでもないです。  

## 仕様
チェスト内のアイテム分割と配置は関数である`fill_container`が使用されていますが、内部処理が不明であるため、擬似的に分割しています。
