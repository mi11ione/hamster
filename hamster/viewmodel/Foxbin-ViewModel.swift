//
//  Foxbin-ViewModel.swift
//  hamster
//
//  Created by mi11ion on 20/01/2023.
//

import Foundation
extension FoxbinView {
    @MainActor class ViewModel: BaseViewModel {
        
        @Published var text: String? = nil
        @Published var error: String? = nil
        
        private let foxbinRepository = FoxbinRepository()
        
        func refresh(for key: String) async {
            self.text = nil
            self.error = nil
            
            do {
                self.text = try await foxbinRepository.provideContent(key: key).get()
            } catch let error as FoxbinError {
                self.error = error.message
            } catch let error {
                print(error)
                self.error = error.localizedDescription
            }
        }
    }
}
