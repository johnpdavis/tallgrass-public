//
//  StepThreeCard.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct StepThreeCard: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            Text("Step Three: \nConfigure Widgets")
                .font(.title)
                .fontWeight(.heavy)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "hand.tap")
                        .font(.title)
                        .frame(width: 30, height: 30)
                    Text("Tap and Hold on the widget and tap 'edit widget' to configure.")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                HStack {
                    Image(systemName: "circle.square")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor.label))
                    Text("Or tap once while in jiggle mode.")
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
    
            Image("Step3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Parameters")
                    .font(.title)
                    .fontWeight(.heavy)

                
                VStack(alignment: .leading) {
                    Text("• Time Per Image")
                        .font(.headline)
                    Text("How long the widget will spend on a pokémon before cycling to the next.")
                        .font(.body)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack(alignment: .leading) {
                    Text("• Show Grass")
                        .font(.headline)
                    Text("Whether or not to display colored grass on the widget.")
                        .font(.body)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding()
        .foregroundColor(Color(UIColor.label))
        .frame(maxWidth: 500)
        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill( Color(UIColor.secondarySystemBackground)).padding(2))
    }
}

struct StepThreeCard_Previews: PreviewProvider {
    static var previews: some View {
        StepThreeCard()
    }
}
