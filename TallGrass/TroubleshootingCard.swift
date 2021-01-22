//
//  TroubleshootingCard.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import SwiftUI
import WidgetKit

struct TroubleshootingCard: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            Text("Troubleshooting")
                .font(.title)
                .fontWeight(.heavy)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    Image(systemName: "memorychip")
                        .font(.title)
                        .frame(width: 30, height: 30)
                    Text("Widgets are subjected to aggresive memory limitations by the system.")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Text("Widgets stuck or appear as blank squares?")
                    .font(.headline)
                    .padding(.top)
                
                HStack(alignment: .top) {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor.label))
                    Text("Tap below to request a refresh of all widgets.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Button(action: {
                    WidgetCenter.shared.reloadAllTimelines()
                }) {
                    HStack {
                        Spacer()
                        Text("Refresh Widgets")
                        Spacer()
                    }
                }
                .padding()
                .buttonStyle(ScryOneButtonStyle())
                
                
                Text("Refresh didn't work?")
                    .font(.headline)
                    .padding(.top)
                
                HStack(alignment: .top) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor.label))
                    Text("Try reducing the number of widgets on your home screen.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                HStack(alignment: .top) {
                    Image(systemName: "deskclock")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor.label))
                    Text("Try changing the \"Time per Image\" to a different interval and back again.")
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                HStack(alignment: .top)  {
                    Image(systemName: "restart.circle")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(UIColor.label))
                    Text("Sometimes widgets are not properly restarted by the system. If all else fails, try restarting your device.")
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
             /*
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Parameters")
                    .font(.title)
                    .fontWeight(.heavy)
                
                VStack(alignment: .leading) {
                    Text("• Album")
                        .font(.headline)
                    Text("Recent images will be displayed from this album.")
                        .font(.body)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                VStack(alignment: .leading) {
                    Text("• Most Recent Count")
                        .font(.headline)
                    Text("Number of the most recent images that will be cycled on the widget.")
                        .font(.body)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("* Not used by the random photo widgets.")
                        .font(.caption)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                VStack(alignment: .leading) {
                    Text("• Time Per Image")
                        .font(.headline)
                    Text("How long the widget will spend on an image before cycling to the next.")
                        .font(.body)
                        .padding(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
             */
        }
        .padding()
        .foregroundColor(Color(UIColor.label))
        .frame(maxWidth: 500)
        .background(RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill( Color(UIColor.secondarySystemBackground)).padding(2))
    }
}

struct TroubleshootingCard_Previews: PreviewProvider {
    static var previews: some View {
        TroubleshootingCard()
    }
}
