//
//  PokemonProvider.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 15/07/23.
//

import Foundation

//public enum PokemonEndpoints {
//    case getPokemon(String)
//}
//
//public enum TypeMethod {
//    case get
//    case post
//}
//
//protocol TargetType {
//    var baseURL: URL { get }
//    var path: String { get }
//    var method: TypeMethod { get }
//    var headers: [String: String] { get }
//}
//
//extension PokemonEndpoints: TargetType {
//    
//    var baseURL: URL {
//        return URL(string: "https://pokeapi.co/api/v2/")!
//    }
//    
//    var path: String {
//        switch self {
//        case .getPokemon(let id):
//            return "pokemon/" + id
//        }
//    }
//    
//    var method: TypeMethod {
//        switch self {
//        case .getPokemon:
//            return .get
//        }
//    }
//    
//    var headers: [String : String] {
//        var headers: [String : String] = [:]
//        return headers
//    }
//    
//    
//}


protocol TargetType {
    var baseURL: URL {get}
    var path: String {get}
    var method: MethodType {get}
    var header: [String] {get}
}

enum MethodType: String {
    case GET, POST
}

public enum PokemonEndpoints {
    case getListPokemon
    case detailPokemon(url: String)
    case getImage(url: String)
}

extension PokemonEndpoints: TargetType {
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/pokemon")!
    }
    
    var path: String {
        switch self {
        case .getListPokemon:
            return String.empty()
        case .detailPokemon(_):
            return String.empty()
        case .getImage(_):
            return String.empty()
        }
    }
    
    var method: MethodType {
        switch self {
        case .getListPokemon:
            return .GET
        case .detailPokemon(_):
            return .GET
        case .getImage(_):
            return .GET
        }
    }
    
    var header: [String] {
        switch self {
        case .getListPokemon:
            return []
        case .detailPokemon(url: _):
            return []
        case .getImage(url: _):
            return []
        }
    }
    
    func request<T: Decodable>(completionHandler: @escaping (T)-> Void) {
        let urlRequest = URLRequest(url: baseURL)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                return
            }
            switch response.statusCode {
            case 200...299:
                guard let data = data else {return}
                let listPokemon = try? JSONDecoder().decode(T.self, from: data)
                completionHandler(listPokemon!)
            default:
                print("Status code 404")
                
            }
        }.resume()
        
    }
    
    func requestAsync<T: Decodable>(url: String) async throws -> T? {
        guard let url = URL(string: url) else {return nil}
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else { return nil }
            switch httpResponse.statusCode {
            case 200...299:
                guard let pokemonDetail = try? JSONDecoder().decode(T.self, from: data) else {return nil}
                return pokemonDetail
            default:
                print("Status code 404")
            }
        } catch {
            throw PokemonError.failedDetailPokemon
            print("Error al hacer la consulta GET")
        }
        return nil
    }
    
}





