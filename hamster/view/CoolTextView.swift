//
//  CoolTextView.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation
import SwiftUI

struct CoolTextView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            TextField("BLYA", text: $viewModel.coolText)
                .padding()
            
            NavigationLink("GO") {
                FoxbinView(key: viewModel.coolText.lowercased())
            }
        }
        .navigationTitle("Cool text!")
    }
}
