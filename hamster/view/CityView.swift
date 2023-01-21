//
//  CityView.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation
import SwiftUI

struct CityView: View {
    
    var city: City
    
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            if viewModel.weather == nil {
                ProgressView()
            } else {
                Text(viewModel.weather!.temperature)
                    .font(.largeTitle)
            }
        }
        .navigationTitle(city.name)
        .toolbar {
            ToolbarItem {
                Button("Refresh") {
                    viewModel.startRefreshTask(for: city)
                }
            }
        }
        .task {
            await viewModel.load(for: city)
        }
        .onDisappear {
            viewModel.cancelRefresh()
        }
    }
}
