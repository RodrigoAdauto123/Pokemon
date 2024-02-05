//
//  PokemonRepository.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation

class PokemonRepository {
    
    func fetchPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {return}
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {return}
            do {
                let pokemonList = try? JSONDecoder().decode(ListPokemon.self, from: data)
                print(pokemonList)
            } catch {
                print("ERROR")
            }
        }.resume()
    }
}
