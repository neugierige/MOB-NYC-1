//
//  MappableParseItem.swift
//  ParseStarterProject
//
//  Created by Luyuan Xing on 3/16/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import MapKit

class MappableParseItem: NSObject, MKAnnotation {
    
    var title: String?
    
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
    
}
