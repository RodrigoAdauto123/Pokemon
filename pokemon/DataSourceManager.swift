//
//  DataSourceManager.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 15/07/23.
//

import Foundation

struct ResultPokemon<T> {
    var success: T
    var error: Error?
     
}

enum PokemonError: Error {
    case failedListPokemon, failedDetailPokemon
}

protocol DataSourceManagerProtocol {
//    typealias ListPokemonResponse = ResultPokemon<ListPokemon, PokemonError?>
    typealias ListPokemonResponse = ResultPokemon<ListPokemon>
    
    func getListPokemons(callbackHandler: @escaping ( (ListPokemonResponse) -> Void))
    
}

class DataSourceManager: DataSourceManagerProtocol {
    var provider: PokemonEndpoints?
    func getListPokemons(callbackHandler: @escaping ((ListPokemonResponse) -> Void)) {
        provider = .getListPokemon
        provider?.request { (listPokemon: ListPokemon) in
            let resultPokemon = ResultPokemon(success: listPokemon, error: nil)
            callbackHandler(resultPokemon)
            print(listPokemon)
        }
    }
    
    
}
