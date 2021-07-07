//
//  LocationModel.swift
//  National Geographic
//
//  Created by Mesut Aygün on 6.07.2021.
//

import Foundation
import MapKit

struct NationalParkLocations : Codable, Identifiable {
    var id : String
    var name : String
    var image : String
    var latitude  : Double
    var longitude : Double
    
    //Computed property
    
    var location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
