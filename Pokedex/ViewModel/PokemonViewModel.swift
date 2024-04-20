//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Putra Nugraha on 20/04/24.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    
    @Published var pokemons = [Pokemon]()
    
    @Published var pokemonDetail: PokemonDetail?
    
    @Published var searchText = ""
    
    var filteredPokemons: [Pokemon] {
        return searchText == "" ? pokemons : pokemons.filter { pokemon in
            pokemon.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemons = getPokemons()
        print(self.pokemons)
    }
    
    func getPokemonDetail(pokemon: Pokemon) {
        let pokemonId = getPokemonIndex(pokemon: pokemon)
        getPokemonDetail(id: pokemonId) { pokemonDetail in
            DispatchQueue.main.async {
                self.pokemonDetail = pokemonDetail
            }
        }
    }
    
    private func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemons.firstIndex(of: pokemon) {
            return index + 1
        }
        
        return 0
    }
    
    private func getPokemons() -> [Pokemon] {
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let results: [Pokemon] = data.results
        
        return results
    }
    
    private func getPokemonDetail(id: Int, _ onSuccess:@escaping(PokemonDetail) -> ()) {
        let url = "https://pokeapi.co/api/v2/pokemon/\(id)"
        Bundle.main.load(
            url: url,
            model: PokemonDetail.self,
            onSuccess: { onSuccess($0) },
            onError: { print($0) }
        )
    }
}
