//
//  ContentView.swift
//  hamster
//
//  Created by mi11ion on 13.01.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @Environment(\.realm) private var realm
    
    @StateObject private var viewModel = ViewModel()
    
    @ObservedResults(Homyak.self) private var homyaks
    
    var body: some View {
        NavigationStack {
            List {
                Section("DALBAEB") {
                    NavigationLink("DAUN") {
                        Image("eblan")
                    }
                    NavigationLink("BLYA") {
                        CoolTextView()
                    }
                }
                
                Section("Weather") {
                    ForEach(viewModel.cities) { city in
                        NavigationLink(city.name) {
                            CityView(city: city)
                        }
                    }
                }
                
                Section("Notes") {
                    NavigationLink("Geometry") {
                        FoxbinView(key: "geometry")
                    }
                }
                
                Section("Homyaks") {
                    Button(action: { viewModel.homyakCreateFormPresented.toggle() }) {
                        Label("New homyak", systemImage: "plus.circle.fill")
                    }
                    .sheet(isPresented: $viewModel.homyakCreateFormPresented) {
                        HomyakFormView(homyak: Homyak())
                    }
                    
                    if !homyaks.isEmpty {
                        Button("Random 567") {
                            try? realm.write {
                                homyaks.randomElement()!.thaw()!.name = "567"
                            }
                        }
                    }
                    
                    ForEach(homyaks) { homyak in
                        Button(homyak.name) {
                            viewModel.homyakEditFormPresented.toggle()
                        }
                        .buttonStyle(.plain)
                        .sheet(isPresented: $viewModel.homyakEditFormPresented) {
                            HomyakFormView(homyak: homyak)
                        }
                    }
                    .onDelete(perform: $homyaks.remove)
                }
            }
            .refreshable {
                await viewModel.load()
            }
            .task {
                await viewModel.load()
            }
            .navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//test
