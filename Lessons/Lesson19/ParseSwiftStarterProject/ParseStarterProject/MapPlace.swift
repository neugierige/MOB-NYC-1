//
//  MapPlace.swift
//  ParseStarterProject
//
//  Created by Rudd Taylor on 3/11/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import MapKit

class MapPlace: NSObject, MKAnnotation {
    var name: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
