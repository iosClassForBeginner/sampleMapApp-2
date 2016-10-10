 
# 第10回: １時間でiPhoneアプリを作ろう (2016/10/15)

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/sample.gif" /></div>
  
  当アカウントへ訪れていただき、誠にありがとうございます。第10回アプリ教室では、地図アプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。
  
## アプリ教室に興味ある方、歓迎します。  
  Meetup  
  http://www.meetup.com/ios-dev-in-namba/
  
## 別途アプリ教室(有料)も開いております  
  http://learning-ios-dev.esy.es/  

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com  

## アプリ作成手順

#### 0, アプリ開発準備
> 0-1. Auto Layout, Size ClassesをOFFにします
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/0.gif" /></div>

> 0-2. MapKitフレームワークを追加します
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/1.gif" /></div>

#### 1, Storyboardで、アプリのデザイン
> 1-1. main.storyboardを選択し、UI部品からMapViewを配置します。(ドラッグ&ドロップ)
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/2.gif" /></div>

> 1-2. 端末サイズ毎に自動でレイアウトするよう設定します
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/3.gif" /></div>

> 1-3. StoryboardのMapViewを、ViewController.swiftに紐づけます
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/sampleMapApp/blob/master/Assets/4.gif" /></div>

#### 2, ViewController.swiftにコード記述
- 以下コードブロックを記入
  
- ヘッダーに、MapKitフレームワークをインポート

```Swift
    import MapKit
```
- 地図の表示を実装します

```Swift
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 緯度・軽度を設定
        let location = CLLocationCoordinate2DMake(34.404,135.308)
        myMap.setCenterCoordinate(location,animated:true)
        
        // 縮尺を設定
        var region = myMap.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        myMap.setRegion(region,animated:true)
        
        // 表示タイプを設定
        myMap.mapType = MKMapType.Standard
//        myMap.mapType = MKMapType.Satellite
//        myMap.mapType = MKMapType.Hybrid
        
        // ピンの設定
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2DMake(34.404,135.308)
        pin.title = "iOS Development Meetup!"
        pin.subtitle = "10/15はColab難波にて、地図アプリを作ります"
        myMap.addAnnotation(pin)
    }
```
