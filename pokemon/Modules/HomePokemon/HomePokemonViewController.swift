//
//  HomePokemon.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import UIKit

class HomePokemonViewController: UIViewController {

    @IBOutlet weak var titlePokemonButton: UIButton!
    @IBOutlet weak var titlePokemon: UILabel!
    
    var presenter: HomePokemonViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter = HomePokemonPresenter(coordinator: self)
        setUp()
    }
    
    private func setUp() {
        titlePokemon.text = "Bienvenido al mundo Pokemon"
        titlePokemonButton.setTitle("Listar Pokemones", for: .normal)
    }
    
    @IBAction func listPokemon(_ sender: Any) {
        presenter?.goToListPokemon()
    }
    

}
