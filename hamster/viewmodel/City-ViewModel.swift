//
//  City-ViewModel.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation

extension CityView {
    @MainActor class ViewModel: BaseViewModel {
        
        @Published var weather: Weather? = nil
        
        private let weatherRepository = WeatherRepository()
        
        private var task: Task<Void, Error>? = nil
        
        func load(for city: City) async {
            weather = nil
            do {
                weather = try await weatherRepository.loadWeather(lat: city.lat, lon: city.lon).get()
            } catch let error {
                print(error)
            }
        }
        
        func startRefreshTask(for city: City) {
            if weather == nil { return }
            
            task = Task {
                await load(for: city)
            }
        }
        
        func cancelRefresh() {
            task?.cancel()
        }
    }
}
