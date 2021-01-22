//
//  RandomCardWidget.swift
//  ScryOne
//
//  Created by John Davis on 1/18/21.
//

import Intents
import SwiftUI
import WidgetKit


struct RandomPokemonEntry: PokemonEntry {
    var date: Date
    let configuration: RandomPokemonConfigurationIntent
    var image: UIImage?
    var pokedexNumber: Int?
    
    var isSnapshot: Bool = false
    var showGrass: Bool = false
}

struct RandomCardEntryProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> RandomPokemonEntry {
        RandomPokemonEntry(date: Date(), configuration: RandomPokemonConfigurationIntent(), image: nil, pokedexNumber: nil)
    }

    func getSnapshot(for configuration: RandomPokemonConfigurationIntent, in context: Context, completion: @escaping (RandomPokemonEntry) -> ()) {
        let entry = RandomPokemonEntry(date: Date(), configuration: configuration, image: nil, pokedexNumber: nil, isSnapshot: true)
        completion(entry)
    }

    func getTimeline(for configuration: RandomPokemonConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        func failedToLoadData(currentDate: Date) {
            let entry = RandomPokemonEntry(date: currentDate, configuration: configuration, image: nil, pokedexNumber: randomPokedexId)
            entries.append(entry)
            
            let timeline = Timeline(entries: entries, policy: .after( Calendar.current.date(byAdding: .second, value: 15, to: currentDate)!))
            completion(timeline)
        }
        
        func handleLoadedImage(currentDate: Date, image: UIImage, showGrass: Bool) {
            let entry = RandomPokemonEntry(date: currentDate, configuration: configuration, image: image, pokedexNumber: randomPokedexId, showGrass: showGrass)
            entries.append(entry)
            
            let timeline = Timeline(entries: entries, policy: .after( Calendar.current.date(byAdding: .minute, value: configuration.refreshDelay.rawValue, to: currentDate)!))
            completion(timeline)
        }
        
        let randomPokedexId = Int.random(in: 0...898)
        var entries: [RandomPokemonEntry] = []
        
        WidgetUtilities.loadDataForPokemon(withPokedexId: randomPokedexId) { pokeData in
            guard let pokeData = pokeData,
                  let imageURLString = pokeData.bestImageURLString,
                  let imageURL = URL(string: imageURLString) else {
                failedToLoadData(currentDate: Date())
                return
            }
            
            WidgetUtilities.loadImageForPokemon(with: imageURL) { image in
                guard let image = image else {
                    failedToLoadData(currentDate: Date())
                    return
                }
                
                let showGrass = configuration.showGrass?.boolValue ?? true
                handleLoadedImage(currentDate: Date(), image: image, showGrass: showGrass)
            }
        }
    }
}

struct RandomCardWidget: Widget {
    let kind: String = "RandomPokemonWidget"
 
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: RandomPokemonConfigurationIntent.self, provider: RandomCardEntryProvider()) { entry in
            WidgetsEntryView(entry: entry, snapshotText: "Random\nPokémon")
                .widgetURL(WidgetUtilities.informationUrlForPokedexId(entry.pokedexNumber))
        }
        .configurationDisplayName("Random Pokémon")
        .description("Displays art of a random Pokémon.")
        .supportedFamilies([.systemSmall])
    }
}
