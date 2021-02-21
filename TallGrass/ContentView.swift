//
//  ContentView.swift
//  Tall Grass
//
//  Created by John Davis on 1/17/21.
//

import SwiftUI

extension URL: Identifiable {
    public var id: String {
        self.absoluteString
    }
}

struct ContentView: View {
    let columns = [ GridItem(.adaptive(minimum: 300, maximum: 600)) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                VStack {
                    OnboardingCard()
                    Spacer()
                }
                
                VStack {
                    StepOneCard()
                    Spacer()
                }
                
                VStack {
                    StepTwoCard()
                    Spacer()
                }
                VStack {
                    StepThreeCard()
                    Spacer()
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
