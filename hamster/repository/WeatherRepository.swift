//
//  WeatherRepository.swift
//  hamster
//
//  Created by mi11ion on 18.01.2023.
//

import Foundation
import SwiftUI

class WeatherRepository: BaseRepository {
    
    func loadWeather(lat: String, lon: String) async -> Result<Weather, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&hourly=temperature_2m")!)
            
            let json = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            let hourly = json["hourly"] as! [String: Any]
            let temperatures = hourly["temperature_2m"] as! [Double]
            
            return Result.success(
                temperatures.map { temperature in
                    Weather(temperature: String(temperature))
                }[0] // TODO
            )
        } catch let error {
            return Result.failure(error)
        }
    }
}
