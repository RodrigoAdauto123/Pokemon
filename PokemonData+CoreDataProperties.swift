//
//  PokemonData+CoreDataProperties.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 10/02/24.
//
//

import Foundation
import CoreData


extension PokemonData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonData> {
        return NSFetchRequest<PokemonData>(entityName: "PokemonData")
    }

    @NSManaged public var nameListPoke_: String?
    @NSManaged public var urlPoke_: String?

}

extension PokemonData : Identifiable {

}
