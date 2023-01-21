//
//  HomyakFormView.swift
//  hamster
//
//  Created by mi11ion on 21/01/2023.
//

import Foundation
import SwiftUI
import RealmSwift

struct HomyakFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var homyak: Homyak
    
    private var updatingItem: Bool {
        homyak.realm != nil
    }
        
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    TextField("Name", text: $homyak.name)
                        .padding(.top)
                    
                    Image("eblan")
                        .resizable()
                        .scaledToFill()
                        .padding(.top)
                    
                }
            }
            .navigationTitle(updatingItem ? "Edit homyak" : "Create homyak")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        if !updatingItem {
                            try? realm.write {
                                realm.add(homyak)
                            }
                        }
                        dismiss()
                    }
                }
            }
        }
    }
}
