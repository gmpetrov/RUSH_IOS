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
//        PIN ECOLE 42
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Ecole 42"
        annotation.subtitle = "Pirate School"
        mapView.addAnnotation(annotation)
        
//        PIN FREE
        let freeLocation = CLLocationCoordinate2D(latitude: 48.8716182, longitude: 2.3204795)
        let pinFree = MKPointAnnotation()
        pinFree.setCoordinate(freeLocation)
        pinFree.title = "Free"
        pinFree.subtitle = "Free HeadQuarter"
        mapView.addAnnotation(pinFree)

//        PIN HOME
        
        let homeLocation = CLLocationCoordinate2D(latitude: 48.8452139, longitude: 2.2973513)
        let pinHome = MKPointAnnotation()
        pinHome.setCoordinate(homeLocation)
        pinHome.title = "Georges's Place"
        pinHome.subtitle = "Lit douillet"
        mapView.addAnnotation(pinHome)
        
//        PIN MEUF
        
        let meufLocation = CLLocationCoordinate2D(latitude: 48.8730678, longitude: 2.3710248)
        let pinMeuf = MKPointAnnotation()
        pinMeuf.setCoordinate(meufLocation)
        pinMeuf.title = "Suzi's Place"
        pinMeuf.subtitle = "Chez ma meuf"
        mapView.addAnnotation(pinMeuf)
        
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

