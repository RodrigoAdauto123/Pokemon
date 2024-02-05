//
//  HomePokemonProtocol.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import Foundation

// View - Presenter
protocol HomePokemonViewPresenterProtocol: AnyObject {
    func goToListPokemon()
}

// Presenter - Router
protocol HomePokemonRouterProtocol: AnyObject {
    func goToListPokemon()
}

// Presenter - View
protocol HomePokemonViewProtocol: AnyObject {
    
}
