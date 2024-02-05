//
//  HomePokemonPresenter.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import Foundation
import UIKit

class HomePokemonPresenter: HomePokemonViewPresenterProtocol {
    
    var coordinator: UIViewController?
    
    var router: HomePokemonRouterProtocol?
    
    init(coordinator: UIViewController) {
        self.coordinator = coordinator
//        self.router = HomePokemonRouter(coordinator: coordinator)
    }
    
    init() {        
    }
    
    func goToListPokemon() {
        router?.goToListPokemon()
    }
    
}
