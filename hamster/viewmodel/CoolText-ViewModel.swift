//
//  CoolText-ViewModel.swift
//  hamster
//
//  Created by mi11ion on 21/01/2023.
//

import Foundation
import SwiftUI

extension CoolTextView {
    @MainActor class ViewModel: ObservableObject {
        @AppStorage("coolTextKey") var coolText = ""
    }
}
