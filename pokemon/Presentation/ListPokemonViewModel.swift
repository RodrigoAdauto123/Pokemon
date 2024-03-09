//
//  ListPokemonViewModel.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 5/02/24.
//

import Foundation

class ListPokemonViewModel: ObservableObject {
 
    @Published var listName = ListPokemonModel(listPokemon: ListPokemon(results: []))
    @Published var pokemonList: [DetailPokemon] = []
    let dataManager = DataSourceManager()
    
    func fetch() {
        dataManager.getListPokemons { [weak self] response in
            if let _ = response.error {return}
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.listName = ListPokemonModel(listPokemon: response.success)
                
                let context = CoreDataStack.shared.persistenceContainer.viewContext
                let pokemon = PokemonData(context: context)
                for urlPoke in self.listName.url {
                    pokemon.urlPoke_ = urlPoke
                }
                
                for namePoke in self.listName.nameList {
                    pokemon.nameListPoke_ = namePoke
                }
                // Usar ListPokemonTransformer para guardar el atributo pokemon
                
                let test = pokemon
                do {
                    try context.save()
                    print("Success")
                } catch {
                    
                }
                    
                
//                Task {
//                    let _ = await self?.fetchDetail()
//                }
            }
        }
    }
    
    func fetchDetail() async -> [DetailPokemon] {
        await withTaskGroup(of: DetailPokemon?.self) { group in
            for urlString in listName.url {
                group.addTask { [weak self] in
                    if let self = self,
                       let data = self.dataManager.getDetailPokemon(url: urlString) {
                        return data
                    }
                    return nil
                }
            }
            for await result in group {
                if let result = result {
                    pokemonList.append(result)
                }
            }
            return pokemonList
        }
        //            if let data = dataManager.getDetailPokemon(url: url) {
        //                pokemonList.append(data)
        //                print(data)
        //            }
        
    }
}
