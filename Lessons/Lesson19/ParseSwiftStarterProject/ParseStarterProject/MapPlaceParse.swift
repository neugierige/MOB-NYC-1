//
//  MapPlaceParse.swift
//  ParseStarterProject
//
//  Created by Luyuan Xing on 3/16/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import MapKit
import Parse

class MapPlaceParse: PFObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
    
}