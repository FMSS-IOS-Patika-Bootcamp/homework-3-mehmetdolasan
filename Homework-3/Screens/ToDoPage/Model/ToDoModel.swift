//
//  ToDoModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//

import Foundation
import CoreData


protocol ToDoModelProtocol: AnyObject {
  func didDataFetchProcessFinish(_ isSuccess: Bool)
}

class ToDoModel {
  
  weak var delegate: ToDoModelProtocol?
  var toDos: [ToDo] = []
  
  func fetchData() {
    
    let fetchRequest: NSFetchRequest<ToDo> = ToDo.fetchRequest()
    do {
      let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
      var results = try context.fetch(fetchRequest)
      results.reverse()
      self.toDos = results
      print(results)
      self.delegate?.didDataFetchProcessFinish(true)
    } catch  {
      print(error.localizedDescription)
      self.delegate?.didDataFetchProcessFinish(false)
    }
  }
}
