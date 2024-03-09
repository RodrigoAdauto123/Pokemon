//
//  ListPokemonTransformer.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 10/02/24.
//

import Foundation
import CoreData


public class ListPokemonTransformer: NSSecureUnarchiveFromDataTransformer {
    static let name = NSValueTransformerName(rawValue: "ListPokemonTransformer")
    
    public override static var allowedTopLevelClasses: [AnyClass] {
        return [ListPokemonModel.self]
    }
    
    static func register() {
        let transformer = ListPokemonTransformer()
        ValueTransformer.setValueTransformer(transformer, forName: name)
    }
    
}
