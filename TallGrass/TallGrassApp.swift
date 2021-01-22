//
//  TallGrassApp.swift
//  TallGrass
//
//  Created by John Davis on 1/19/21.
//

import SwiftUI

@main
struct TallGrassApp: App {
    @State var selection: Int = 0
    
    @State var fullScreenURL: URL?
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: self.$selection) {
                NavigationView {
                    ContentView()
                        .navigationBarTitle("Tall Grass", displayMode: .inline)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    if selection == 0 {
                        Image(systemName: "leaf.fill")
                    } else {
                        Image(systemName: "leaf")
                    }
                    Text("Tall Grass")
                }
                .tag(0)
                
                NavigationView {
                    ScrollView {
                        VStack {
                            TroubleshootingCard()
                            Spacer()
                        }
                        .padding()
                    }
                    .navigationBarTitle("Troubleshooting", displayMode: .inline)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem {
                    if selection == 1 {
                        Image(systemName: "hand.raised.fill")
                    } else {
                        Image(systemName: "hand.raised")
                    }
                    Text("Help")
                }
                .tag(1)
            }
            .fullScreenCover(item: $fullScreenURL, onDismiss: {
                fullScreenURL = nil
            }, content: { url in
                SafariView(url: url, tintColor: UIColor(named: "AccentColor")!)
                    .ignoresSafeArea()
            })
            .onOpenURL(perform: { url in
                fullScreenURL = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                    fullScreenURL = url
                })
            })
        }
    }
}
