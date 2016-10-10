//
//  ViewController.swift
//  sampleMapApp
//
//  Created by Wataru Maeda on 10/10/16.
//  Copyright © 2016 wataru maeda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var myMap: MKMapView!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

