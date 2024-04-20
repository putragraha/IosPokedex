//
//  Pokemon.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import Foundation

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static let sample = Pokemon(
        name: "Mewone",
        url: "https://pokeapi.co/api/v2/pokemon/151"
    )
}
