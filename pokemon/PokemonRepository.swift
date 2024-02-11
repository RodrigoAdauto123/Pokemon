//
//  PokemonRepository.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation
import Combine

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
    
    func fetchDetailPokemon(urlString: String) async throws {
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        let data = try await URLSession.shared.data(for: urlRequest)
        do {
            let pokemonDetail = try JSONDecoder().decode(DetailPokemon.self, from: data.0)
            print("Hilo actual2: \(Thread.current)")
            print("Imagen de pokemon por defecto: \(pokemonDetail.sprites.frontDefault)")
        } catch {
            print("Error al parsear")
        }
    }
    
}
