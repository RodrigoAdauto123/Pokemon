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
    case failedListPokemon, failedDetailPokemon, failedLoadImage
}

protocol DataSourceManagerProtocol {
//    typealias ListPokemonResponse = ResultPokemon<ListPokemon, PokemonError?>
    typealias ListPokemonResponse = ResultPokemon<ListPokemon>
    
    func getListPokemons(callbackHandler: @escaping ( (ListPokemonResponse) -> Void))
    func getDetailPokemon(url: String) async throws -> DetailPokemon?
//    func getDetailPokemon(url: String, completion: @escaping (DetailPokemon?) -> Void)
    
}

class DataSourceManager: DataSourceManagerProtocol {
    
    func getDetailPokemon(url: String) -> DetailPokemon? {
        provider = .detailPokemon(url: url)
        Task {
            do {
                let result: DetailPokemon? = try await provider?.requestAsync(url: url)
                return result
            } catch {
                print("Error al hacer la consulta")
            }
            return nil
        }
        return nil
    }
    
//    func getDetailPokemon(url: String, completion: @escaping (DetailPokemon?) -> Void) {
//        provider = .detailPokemon(url: url)
//        Task {
//            do {
//                let result: DetailPokemon? = try await provider?.requestAsync(url: url)
//                completion(result)
//            } catch {
//                print("Error al hacer la consulta")
//            }
//        }
//    }
    
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
