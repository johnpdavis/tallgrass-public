//
//  OnboardingView.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct OnboardingCard: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Tall Grass")
                    .font(.title)
                    .fontWeight(.black)
                
                Text("Decorate your home screen with a random Pokémon.")
                    .font(.body)
                
                HStack {
                    Spacer()
                    Image("pokeball")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Spacer()
                }
            }
            .padding()
            .overlay(
                VStack {
                    Spacer()
                    Image("Grass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            )

        }
        .foregroundColor(.white)
        .frame(maxWidth: 500)
        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill(LinearGradient(gradient: Gradient(colors: [Color("DarkBackground"), Color("LightBackground")]), startPoint: .top, endPoint: .bottom)).padding(2))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCard()
    }
}
