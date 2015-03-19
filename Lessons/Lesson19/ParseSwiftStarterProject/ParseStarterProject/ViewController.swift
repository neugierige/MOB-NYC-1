//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ViewController: UIViewController, UIAlertViewDelegate, MKMapViewDelegate {
    
    var mapView = MKMapView()
    var mapItems: [MapPlaceParse] = [] {
        didSet {
            self.mapView.removeAnnotations(self.mapView.annotations)
            self.mapView.addAnnotations(self.mapItems)
            self.mapView.showAnnotations(self.mapItems, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        
        self.mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(self.mapView)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[map]|", options: .allZeros, metrics: nil, views: ["map": self.mapView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[top][map]|", options: .allZeros, metrics: nil, views: ["top": self.topLayoutGuide, "map": self.mapView]))
    }
    
    override func viewWillAppear(animated: Bool) {
        //PARSE QUERY first
        
        var query = PFQuery(className: "Place")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            println(objects) //PRINT OUT objects saved in class
            if let objects = objects {
                for object in objects {
                    var pfObject = object as PFObject
                    if let geopoint = pfObject["geopoint"] as? PFGeoPoint {
                        var mapItem = MapPlaceParse(coordinate: CLLocationCoordinate2DMake(geopoint.latitude, geopoint.longitude))
                        self.mapItems.append(mapItem)
                    }
                }
            }
        }
        
    }
    
    @IBAction func didTapAdd(sender: AnyObject) {
        var alert = UIAlertView(title: "Add Place", message: "Enter a place name", delegate: self, cancelButtonTitle: "Dismiss", otherButtonTitles: "Add")
        alert.alertViewStyle = .PlainTextInput
        alert.show()
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("MapAnnotation")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "MapAnnotation")
        }
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex != alertView.cancelButtonIndex {
            // Add something to the map
            if let string = alertView.textFieldAtIndex(0)?.text {
                self.addPlaceNameToMap(string)
            }
        }
    }
    
    
    func addPlaceNameToMap(name: String) {
        var searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = name
        var search = MKLocalSearch(request: searchRequest)
        search.startWithCompletionHandler { (response, error) -> Void in
            if let mapItem = response.mapItems.first as? MKMapItem {
                var parseItem = PFObject(className: "Place")
                parseItem.setValue(name, forKey: "name")
                parseItem.setValue(PFGeoPoint(latitude: mapItem.placemark.location.coordinate.latitude, longitude: mapItem.placemark.location.coordinate.longitude), forKey: "geopoint")
                
                //parseItem.save() //synchronous call on UI thread -> BAD
                parseItem.saveInBackground()
                //parseItem.saveInBackground({(save, error) -> Void in 
                //self.mapItems.append(parseItem)})
            }
        }
    }


    
//****** WITHOUT PARSE

//    func addPlaceNameToMap(name: String) {
//        var searchRequest = MKLocalSearchRequest()
//        searchRequest.naturalLanguageQuery = name
//        var search = MKLocalSearch(request: searchRequest)
//        search.startWithCompletionHandler { (response, error) -> Void in
//            if let mapItem = response.mapItems.first as? MKMapItem {
//                var mapItem = MapPlace(coordinate: mapItem.placemark.coordinate)
//                mapItem.title = name
//                self.mapItems.append(mapItem)
//            }
//        }
//    }
}


