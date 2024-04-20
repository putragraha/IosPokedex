//
//  PokemonView.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import SwiftUI

struct PokemonView: View {
    
    @EnvironmentObject var viewModel: PokemonViewModel
    
    let pokemon: Pokemon
    
    let dimension: Double = 140
    
    var body: some View {
        let pokemonIndex = viewModel.getPokemonIndex(pokemon: pokemon)
        let imageUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemonIndex).png")
        VStack {
            AsyncImage(url: imageUrl) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            .frame(width: dimension, height: dimension)
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.sample)
}
