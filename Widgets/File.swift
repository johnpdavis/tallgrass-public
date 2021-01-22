//
//  File.swift
//  WidgetsExtension
//
//  Created by John Davis on 1/20/21.
//

import Foundation

struct OtherSprites: Codable {
    var dreamWorld: Sprite?
    var officialArtwork: Sprite?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
}

struct Sprite: Codable {
    var frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct Sprites: Codable {
    var frontDefault: String?
    var frontShiny: String?
    var other: OtherSprites?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case other = "other"
    }
    
}

struct PokeData: Codable {
    var sprites: Sprites?
    
    var bestImageURLString: String? {
        return sprites?.other?.officialArtwork?.frontDefault ??
            sprites?.other?.dreamWorld?.frontDefault
    }
    
    var bestSpriteURLString: String? {
        return sprites?.frontDefault
    }
}
