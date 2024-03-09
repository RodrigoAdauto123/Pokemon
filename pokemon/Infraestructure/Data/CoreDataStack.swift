//
//  CoreDataStack.swift
//  pokemon
//
//  Created by Rodrigo Adauto Ortiz on 6/02/24.
//

import CoreData

class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    lazy var persistenceContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PokemonModel")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("CRASH PIPIPI")
            }
        }
        return container
    }()
    
    private init(){}
    
}

extension CoreDataStack {
    func save() {
        guard persistenceContainer.viewContext.hasChanges else {return}
        
        do {
            try persistenceContainer.viewContext.save()
        } catch {
            print("FAILED")
        }
    }
    
    func delete(item: NSManagedObject) {
        persistenceContainer.viewContext.delete(item)
        save()
    }
}
