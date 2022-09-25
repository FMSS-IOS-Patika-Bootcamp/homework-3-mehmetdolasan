//
//  DetailToDoModel.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//

import Foundation

protocol DetailToDoModelProtocol: AnyObject {
  func didFetchProcessFinish(_ isSuccess: Bool)
}

class DetailToDoModel {
  
  weak var delegate: DetailToDoModelProtocol?
  
  var todo: ToDo?
  
  func fetchData() {
    
    if let status = todo?.status {
      if !status {
        print("false")
        todo?.status = true
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
      } else {
        print("true")
        todo?.status = false
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
      }
    }
    
  }
}
