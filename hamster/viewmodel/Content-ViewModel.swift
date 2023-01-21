//
//  Content-ViewModel.swift
//  hamster
//
//  Created by mi11ion on 18.01.2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: BaseViewModel {
        
        @Published var cities = [City]()
        
        @Published var homyakCreateFormPresented = false
        @Published var homyakEditFormPresented = false
        
        private let citiesRepository = CitiesRepository()
        
        func load() async {
            cities = await citiesRepository.provideCities()
        }
    }
}
