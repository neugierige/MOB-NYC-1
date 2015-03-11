//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import MapKit
import Parse

class ViewController: UIViewController, UIAlertViewDelegate {

    var mapView = MKMapView()
    var mapItems: [MapPlace] = [] {
        didSet {
            self.mapView.removeAnnotations(self.mapView.annotations)
            self.mapView.addAnnotations(self.mapItems)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(self.mapView)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[map]|", options: .allZeros, metrics: nil, views: ["map": self.mapView]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[top][map]|", options: .allZeros, metrics: nil, views: ["top": self.topLayoutGuide, "map": self.mapView]))
    }
    
    @IBAction func didTapAdd(sender: AnyObject) {
        var alert = UIAlertView(title: "Add Place", message: "Enter a place name", delegate: self, cancelButtonTitle: "Dismiss", otherButtonTitles: "Add")
        alert.alertViewStyle = .PlainTextInput
        alert.show()
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
                var mapItem = MapPlace(coordinate: mapItem.placemark.coordinate)
                self.mapItems.append(mapItem)
            }
        }
    }
}

