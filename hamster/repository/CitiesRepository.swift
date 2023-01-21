//
//  CitiesRepository.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation

class CitiesRepository: BaseRepository {
    let cities = [
        City(name: "Moscow", lat: "55.751244", lon: "37.618423"),
        City(name: "Perm", lat: "58.029682", lon: "56.266792")
    ]
    
    func provideCities() async -> [City] {
        return cities
    }
}
