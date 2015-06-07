//
//  GoogleMapsViewController.swift
//  MasterFindrHome
//
//  Created by Georgie Halpern on 6/5/15.
//  Copyright (c) 2015 ghalpern. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var camera = GMSCameraPosition.cameraWithLatitude(41.8262, longitude: -71.4032, zoom: 12)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        var demoMarker = GMSMarker()
        demoMarker.position = camera.target
        demoMarker.snippet = "I lost my Canada Goose jacket! :("
        demoMarker.appearAnimation = kGMSMarkerAnimationPop
        demoMarker.map = mapView
        
        self.view = mapView
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func addPin(sender: UILongPressGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            let coordinate = mapView.convertPoint(sender.locationInView(mapView), toCoordinateFromView: mapView)
            println("Coordinates: \(coordinate.latitude, coordinate.longitude)")
       }
    }
    
    
}