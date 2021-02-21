//
//  TallGrassButtonStyle.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct TallGrassButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .foregroundColor(configuration.isPressed ? Color("darkBackground") : .white)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color("darkBackground").opacity( configuration.isPressed ? 0.4 : 1.0))
            )
    }
}
