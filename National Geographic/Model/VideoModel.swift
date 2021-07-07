//
//  VideoModel.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import Foundation

struct Video : Codable , Identifiable {
    
    let id : String
    let name : String
    let headline : String
    
    var thumbnail : String {
        "video-\(id)"
    }
}
