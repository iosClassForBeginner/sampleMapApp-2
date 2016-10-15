//
//  ViewController.swift
//  sampleMapApp
//
//  Created by Wataru Maeda on 10/10/16.
//  Copyright © 2016 wataru maeda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    var myLocationManager: CLLocationManager!
    var currentLatitude: Double = 0
    var currentLongitude: Double = 0
    var pin: MKPointAnnotation!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setLocationManager()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLocationManager () {
        // 現在地の取得.
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        
        // 取得精度の設定.
        myLocationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // 取得頻度の設定.
        myLocationManager.distanceFilter = 300

        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.NotDetermined) {
            print("didChangeAuthorizationStatus:\(status)");
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            myLocationManager.requestWhenInUseAuthorization()
        }
        
        if(status == CLAuthorizationStatus.AuthorizedWhenInUse) {
            myLocationManager.startUpdatingLocation()
        }

    }

    func setLocation () {
        // 緯度・軽度を設定
        let location = CLLocationCoordinate2DMake(currentLatitude,currentLongitude)
        myMap.setCenterCoordinate(location,animated:true)
        
        // 縮尺を設定
        var region = myMap.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        myMap.setRegion(region,animated:false)
        
        // 表示タイプを設定
        myMap.mapType = MKMapType.Standard
        //        myMap.mapType = MKMapType.Satellite
        //        myMap.mapType = MKMapType.Hybrid
        
        // ピンの設定
        pin = MKPointAnnotation()
        pin.coordinate = location
        pin.title = "XXXXXXXXXXXXXXXX"
        pin.subtitle = "XXXXXXXXXXXXXXXX"
        myMap.addAnnotation(pin)
    }
    
    // MARK: - DELEGATE CLLocationManager
    // 位置情報取得に成功したときに呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 緯度・経度の表示.
        myLocationManager.stopUpdatingLocation()
        currentLatitude = manager.location!.coordinate.latitude
        currentLongitude = manager.location!.coordinate.longitude
        setLocation()
    }
    
    // 位置情報取得に失敗した時に呼び出されるデリゲート.
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        myLocationManager.stopUpdatingLocation()
        print("could not get location");
    }



}

