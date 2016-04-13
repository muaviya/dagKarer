//
//  MapRayonViewController.swift
//  FBTestApp2
//
//  Created by Muaviya on 07.04.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit
import MapKit

class MapRayonViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var myPosition = CLLocationCoordinate2D()
    
    var lat = String(NSUserDefaults().valueForKey("lat")!)
    var lng = String(NSUserDefaults().valueForKey("lng")!)

    @IBOutlet var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomToRegion()
        
        pointAnnotation()
        
        myMapView.delegate = self
        
        
    }
    
    func pointAnnotation() {
        
        let info1 = MKPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(Double(lat)!, Double(lng)!)
        info1.title = "Info1"
        info1.subtitle = "Subtitle"
        
        myMapView.addAnnotation(info1)
        
    }
    
    
    func zoomToRegion() {
        
        let location = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(lng)!)
        
        let region = MKCoordinateRegionMakeWithDistance(location, 4000.0, 7000.0)
        
        myMapView.setRegion(region, animated: true)
        
    }

    
    @IBAction func segmentedControlAction(sender: UISegmentedControl!) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            myMapView.mapType = .Standard
        case 1:
            myMapView.mapType = .Satellite
        default: // or case 2
            myMapView.mapType = .Hybrid
        }
    }
    
}