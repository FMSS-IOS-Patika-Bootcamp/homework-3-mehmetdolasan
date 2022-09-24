//
//  CoreDataStack.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//

import CoreData
import Foundation

class CoreDataStack {
  
  private let modelName: String
  
  init(modelName: String) {
    self.modelName = modelName
  }
  
  private lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: modelName)
    container.loadPersistentStores { _, error in
      if let error = error {
        print("unsuccessful container loading... \(error.localizedDescription)")
      }
    }
    return container
  }()
  
  lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
  
  func saveContext() {
    guard managedContext.hasChanges else {
      return
    }
    
    do {
      try managedContext.save()
      print("Successfuly Saved")
    } catch let error as NSError {
      print("unresolved error \(error)")
    }
  }
}
