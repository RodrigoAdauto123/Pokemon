//
//  PokemonEntity.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation

struct Pokemon: Decodable {
    var name: String
    var url: String
}

struct ListPokemon: Decodable {
    var results: [Pokemon]
}
