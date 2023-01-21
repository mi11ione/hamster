//
//  FoxbinView.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation
import SwiftUI

struct FoxbinView: View {
    
    var key: String
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            if viewModel.text == nil && viewModel.error == nil {
                ProgressView()
            } else {
                ScrollView {
                    Text(viewModel.text == nil ? viewModel.error! : viewModel.text!)
                        .foregroundColor(viewModel.text == nil ? .red : nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
            }
        }
        .task {
            await viewModel.refresh(for: key)
        }
        .navigationTitle(key)
    }
}
