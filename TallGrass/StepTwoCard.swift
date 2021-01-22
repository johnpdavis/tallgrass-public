//
//  StepTwoCard.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct StepTwoCard: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            Text("Step Two: \nPicking Widgets")
                .font(.title)
                .fontWeight(.heavy)
            Text("Tall Grass provides one widget type:")
                .font(.headline)
            
            
            HStack {
                Image(systemName: "leaf")
                    .frame(width: 32, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(Color(UIColor.label), lineWidth: 2))
                Text("Random Pokémon - Cycles through random pokémon.")
                    .padding(.leading)
            }
            
            Divider().padding()
            
            HStack(alignment: .top) {
                Image("Step2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 150)
                    .mask(RoundedRectangle(cornerRadius: 15, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment: .top) {
                        Image(systemName: "1.circle")
                            .font(.title)
                        Text("Find the widget you want")
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    HStack(alignment: .top) {
                        Image(systemName: "2.circle")
                            .font(.title)
                        Text("Tap the 'Add Widget' Button")
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(Color(UIColor.label))
        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill( Color(UIColor.secondarySystemBackground)).padding(2))
    }
}

struct StepTwoCard_Previews: PreviewProvider {
    static var previews: some View {
        StepTwoCard()
    }
}
