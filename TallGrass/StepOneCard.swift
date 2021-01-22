//
//  StepOneCard.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct StepOneCard: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            Text("Step One:\nAdding Widgets")
                .font(.title)
                .fontWeight(.heavy)

            Image("Step1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Image(systemName: "1.circle")
                        .font(.title)
                        .foregroundColor(Color(UIColor.label))
                    Text("Tap and Hold on the home screen to enter \"jiggle mode\".")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "2.circle")
                        .font(.title)
                        .foregroundColor(Color(UIColor.label))
                    Text("Tap the + button at the top of the screen.")
                        .font(.body)
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

struct StepOneCard_Previews: PreviewProvider {
    static var previews: some View {
        StepOneCard()
    }
}
