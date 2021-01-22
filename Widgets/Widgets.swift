//
//  Widgets.swift
//  Widgets
//
//  Created by John Davis on 1/17/21.
//

import WidgetKit
import SwiftUI
import Intents

extension RefreshDelay {
    var minutes: Int {
        switch self {
        case .unknown:
            return 10
        case .fiveMinutes:
            return 5
        case .tenMinutes:
            return 10
        case .fifteenMinutes:
            return 15
        case .thirtyMinutes:
            return 30
        case .oneHour:
            return 60
        case .threeHours:
            return 180
        case .sixHours:
            return 360
        }
    }
}

protocol PokemonEntry: TimelineEntry {
    var date: Date { get }

    var image: UIImage? { get }
    var pokedexNumber: Int? { get }
    var isSnapshot: Bool { get set }
    
    var showGrass: Bool { get }
}

struct WidgetUtilities {
    static var urlSession = URLSession(configuration: .default)
    
    static var pokedexFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 3
        return numberFormatter
    }
    
    static func pokeDataUrlForPokedexId(_ pokedexId: Int) -> URL? {
        
        let uri = "https://pokeapi.co/api/v2/pokemon/\(pokedexId)"
        
        guard let url = URL(string: uri) else {
            return nil
        }
        
        return url
    }
    
    static func informationUrlForPokedexId(_ pokedexId: Int?) -> URL? {
        guard let pokedexId = pokedexId,
              let pokedexIdString = WidgetUtilities.pokedexFormatter.string(from: NSNumber(value: pokedexId)) else { return nil }
        
        let uri = "https://www.pokemon.com/us/pokedex/\(pokedexIdString)"
        guard let url = URL(string: uri) else {
            return nil
        }
        
        return url
    }
    
    static func loadDataForPokemon(withPokedexId pokedexId: Int, completion: @escaping (PokeData?) -> Void) {
        guard let url = pokeDataUrlForPokedexId(pokedexId) else { completion(nil); return }
        
        let dataTask = WidgetUtilities.urlSession.dataTask(with: url) { data, response, error in
            if let pokeDataData = data,
               let pokeData = try? JSONDecoder().decode(PokeData.self, from: pokeDataData) {
                completion(pokeData)
            } else {
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    static func loadImageForPokemon(with url: URL, completion: @escaping (UIImage?) -> Void) {
        
        let imageTask = WidgetUtilities.urlSession.dataTask(with: url) { data, response, error in
            if let imageData = data,
               let image = UIImage(data: imageData) {
                completion(image)
            } else {
                print("Unable to load image data for card")
                completion(nil)
            }
        }
        imageTask.resume()
    }
}


struct WidgetsEntryView : View {
    var entry: PokemonEntry
    var snapshotText: String
    
    var backgroundColor: Color {
        if let averageImageColor = entry.image?.getNonBlackColors(quality: .low)?.backgroundOrOther  {
            return Color(averageImageColor)
        } else {
            return Color("WidgetBackground")
        }
    }
    
    var backgroundGrassColor: Color {
        if let averageImageColor = entry.image?.getNonBlackColors(quality: .low)?.secondaryOrOther {
            return Color(averageImageColor)
        } else {
            return Color("LightGrassDefault")
        }
    }
    
    var backgroundGrassGradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [backgroundGrassColor, .clear]), startPoint: .top, endPoint: .bottom)
    }
    
    var foregroundGrassColor: Color {
        if let averageImageColor = entry.image?.getNonBlackColors(quality: .low)?.primaryOrOther {
            return Color(averageImageColor)
        } else {
            return Color("DarkGrassDefault")
        }
    }
    
    
    var body: some View {
        GeometryReader { proxy in
            
            if entry.isSnapshot {
                ZStack {
                    ContainerRelativeShape()
                        .inset(by: 12)
                        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [5]))
                        .overlay(
                            VStack(spacing: 5){
                                Text(snapshotText)
                                    .multilineTextAlignment(.center)
                                    .font(.headline)
                            })
                    
                    VStack {
                        Spacer()
                        Image("Grass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                    }
                }
                .foregroundColor(.white)
            } else {
                ZStack {
                    if let image = entry.image {
                        ZStack {
                            if entry.showGrass {
                                VStack {
                                    Spacer()
                                    backgroundGrassGradient.mask(
                                        VStack {
                                            Spacer()
                                            Image("Grass")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: proxy.size.width, height: proxy.size.height / 3)
                                                .clipped()
                                        }
                                    )
                                    .frame(width: proxy.size.width, height: proxy.size.height / 3)
                                }
                                .offset(y: -proxy.size.height / 8)
                            }
                            
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxy.size.width, height: proxy.size.height)
                                .clipped()
                                .shadow(radius: 5)
                        
                            if entry.showGrass {
                            VStack {
                                Spacer()
                                Image("Grass")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(foregroundGrassColor)
                                    .frame(width: proxy.size.width, height: proxy.size.height / 4)
                                    .clipped()
                                    .shadow(radius: 3)
                            }
                            }
                        }
                    } else {
                        HStack {
                            Spacer()
                            VStack(spacing: 0) {
                                Spacer()
                                Text("Refreshing...")
                                    .padding()
                                Spacer()
                                Image("Grass")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                    .clipped()
                            }
                            .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
        .background(backgroundColor)
    }
}


@main
struct Widgets: WidgetBundle {
    let kind: String = "Widgets"
    
    @WidgetBundleBuilder
    var body: some Widget {
        RandomCardWidget()
    }
}

struct Widgets_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetsEntryView(entry: RandomPokemonEntry(date: Date(), configuration: RandomPokemonConfigurationIntent(), image: nil, pokedexNumber: nil, isSnapshot: true), snapshotText: "Random\nPokémon")
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
