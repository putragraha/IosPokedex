//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var viewModel: PokemonViewModel
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            if let pokemonDetail = viewModel.pokemonDetail {
                Text("**ID**: \(pokemonDetail.id)")
                Text("**Weight**: \(formatBodySize(value: pokemonDetail.weight)) Kg")
                Text("**Height**: \(formatBodySize(value: pokemonDetail.height)) m")
            }
        }
        .onAppear {
            viewModel.getPokemonDetail(pokemon: pokemon)
        }
    }
    
    private func formatBodySize(value: Int) -> String {
        let doubleValue = Double(value)
        let result = String(format: "%.2f", doubleValue / 10)
        
        return result
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.sample)
}
