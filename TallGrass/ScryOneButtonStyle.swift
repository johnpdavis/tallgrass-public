//
//  ScryOneButtonStyle.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI

struct ScryOneButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .foregroundColor(configuration.isPressed ? Color("DarkBackground") : .white)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color("DarkBackground").opacity( configuration.isPressed ? 0.4 : 1.0))
            )
    }
}
