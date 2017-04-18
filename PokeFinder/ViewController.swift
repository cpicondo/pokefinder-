//
//  ViewController.swift
//  PokeFinder
//
//  Created by christian Picondo on 18/04/2017.
//  Copyright © 2017 cpicondo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow // the map follows the user's location
    }

    override func viewDidAppear(_ animated: Bool) {
        
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            mapView.showsUserLocation = true
        } else {
            
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status  == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    // function that center the user in mapview in 2 miles
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        
        if let loc = userLocation.location {
            
            if !mapHasCenteredOnce {
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView: MKAnnotationView?
        
        if annotation.isKind(of: MKUserLocation.self) {
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            
            annotationView?.image = UIImage(named: "ash")
            
        }
        return annotationView
    }
    

    @IBAction func spotRandomPokemon(_ sender: UIButton) {
    }

}

















