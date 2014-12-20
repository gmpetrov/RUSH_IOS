//
//  SecondViewController.swift
//  Rush42
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        let location = CLLocationCoordinate2D(
            latitude: 48.896696,
            longitude: 2.318451

        )
        let locationManager = CLLocationManager()
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Ecole 42"
        annotation.subtitle = "Pirate School"
        mapView.addAnnotation(annotation)
        
        mapView.delegate = self
        mapView.mapType = MKMapType.Standard
        mapView.showsUserLocation = true
        
        let userLocation = MKUserLocation()
        userLocation.setCoordinate(location);
        mapView.addAnnotation(userLocation)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func mapTypeSegmentPressed(sender: AnyObject) {
        let segmentedControl = sender as UISegmentedControl
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.Standard
        case 1:
            mapView.mapType = MKMapType.Satellite
        case 2:
            mapView.mapType = MKMapType.Hybrid
        default:
            mapView.mapType = mapView.mapType
        }
    }
    
    @IBAction func mapFindMePressed(sender: AnyObject){
        
        let location = CLLocationCoordinate2D(
            latitude: 48.896696,
            longitude: 2.318451
            
        )
        let locationManager = CLLocationManager()
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
    }

}

