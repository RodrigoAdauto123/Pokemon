//
//  ListPokemonModel.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation
import SwiftUI

protocol ListPokemonModelProtocol: AnyObject {
    
}

class ListPokemonModel: ListPokemonModelProtocol {
    var nameList: [String]
    var url: [String]
    var image: Image?
    
    init(listPokemon: ListPokemon) {
        nameList = listPokemon.results.map(\.name)
        url = listPokemon.results.map(\.url)
    }
}
