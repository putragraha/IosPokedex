//
//  PokemonPage.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}
