//
//  HomePokemonRouter.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import Foundation
import UIKit
import SwiftUI

class HomePokemonRouter: HomePokemonRouterProtocol {
    
    var coordinator: UIViewController?
    
    init(coordinator: UIViewController){
        self.coordinator = coordinator
    }
    
    func goToListPokemon() {
        
//        let mainStoryBoard = UIStoryboard(name: "ListPokemons", bundle: nil)
//        
//        guard let listPokemonView = mainStoryBoard.instantiateViewController(
//            withIdentifier: "ListPokemonViewController") as? ListPokemonViewController
//        else {
//            return
//        }
//        coordinator?.navigationController?.pushViewController(listPokemonView, animated: true)
        
        let viewModel = ListPokemonViewModel()
        let view = ListPokemonView(model: viewModel)
        let hostingController = UIHostingController(rootView: view)
        coordinator?.navigationController?.pushViewController(hostingController, animated: true)
    }
    
}
