//
//  City.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation

struct City: Identifiable {
    var name: String
    
    var lat: String
    var lon: String
    
    var id = UUID()
}
