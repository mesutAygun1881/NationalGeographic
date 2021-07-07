//
//  AnimalModel.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import Foundation

struct Animal : Codable , Identifiable {
    
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
    
}
