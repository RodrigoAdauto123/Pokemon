//
//  ListPokemon.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 14/07/23.
//

import UIKit

class ListPokemonViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Lista de Pokemones"
        fetch()
        // Do any additional setup after loading the view.
    }
    
    private func fetch() {
//        let repository = PokemonRepository()
//        repository.fetchPokemon()
        let dataManager = DataSourceManager()
        dataManager.getListPokemons { response in
            print(response)
        }
    }

}
