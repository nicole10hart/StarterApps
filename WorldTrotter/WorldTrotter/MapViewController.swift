//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Hart, Nicole on 4/3/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
//        let userLocationButton: UIButton = UIButton(frame: CGRect(x: self.view.frame.size.width, y: self.view.frame.size.height, width: 50, height: 50))
//        userLocationButton.setImage(UIImage(named: "location"), for: UIControlState.normal)
//        userLocationButton.addTarget(self, action: #selector(getCurrentLocation), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(userLocationButton)
       
//        let locationBottomConstraint = userLocationButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: 8)
//        let locationTrailingConstraint = userLocationButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
//        locationBottomConstraint.isActive = true
//        locationTrailingConstraint.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view.")
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
//    func getCurrentLocation(_ locationButton: UIButton!) {
//        var locationManager:CLLocationManager!
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestAlwaysAuthorization()
//        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.startUpdatingLocation()
//        }
//        
//        let userLocation:CLLocation = locations[0] as CLLocation
//        
//        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        
//        mapView.setRegion(region, animated: true)
//
//    }

}
